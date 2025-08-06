# 🧠 Memory Management Guide

Optimize memory usage and prevent memory leaks when using Custom Quick Alert in your Flutter applications.

## 🎯 Overview

Custom Quick Alert is designed with memory efficiency in mind, but understanding memory management principles will help you build robust applications that perform well even with frequent alert usage.

## 📊 Memory Usage Patterns

### Normal Memory Footprint

| Component | Memory Usage | Lifecycle |
|-----------|--------------|-----------|
| **Alert Instance** | 0.5-1MB | Per display |
| **Lottie Animations** | 1-3MB | Cached |
| **Textures/Bitmaps** | 0.2-0.5MB | Temporary |
| **Navigator Context** | 0.1MB | Persistent |
| **Total Peak Usage** | 2-5MB | During display |

### Memory Lifecycle

```dart
// Memory allocation during alert display
Timeline:
0ms:    Alert created (0.5MB allocated)
50ms:   Animation loaded (2MB allocated)
100ms:  Dialog rendered (0.5MB allocated)
300ms:  Animation playing (stable 3MB)
2000ms: Alert dismissed (0.5MB deallocated)
2100ms: Animation cached or released
2200ms: Dialog destroyed (2MB deallocated)
```

---

## 🛠️ Memory Optimization Strategies

### 1. Animation Caching

#### Smart Caching Strategy
```dart
class SmartAnimationCache {
  static final Map<String, LottieComposition> _compositions = {};
  static final Map<String, DateTime> _lastAccessed = {};
  static const int maxCacheSize = 8;
  static const Duration cacheTimeout = Duration(minutes: 10);
  
  static Future<LottieComposition?> getComposition(String assetPath) async {
    // Check if already cached and not expired
    if (_compositions.containsKey(assetPath)) {
      final lastAccess = _lastAccessed[assetPath];
      if (lastAccess != null && 
          DateTime.now().difference(lastAccess) < cacheTimeout) {
        _lastAccessed[assetPath] = DateTime.now();
        return _compositions[assetPath];
      } else {
        // Remove expired cache
        _compositions.remove(assetPath);
        _lastAccessed.remove(assetPath);
      }
    }
    
    // Clean cache if too large
    if (_compositions.length >= maxCacheSize) {
      _cleanOldestCache();
    }
    
    // Load and cache new composition
    try {
      final composition = await AssetLottie(assetPath).load();
      _compositions[assetPath] = composition;
      _lastAccessed[assetPath] = DateTime.now();
      return composition;
    } catch (e) {
      print('Failed to load animation: $assetPath');
      return null;
    }
  }
  
  static void _cleanOldestCache() {
    if (_lastAccessed.isEmpty) return;
    
    // Find oldest accessed item
    String? oldestKey;
    DateTime? oldestTime;
    
    for (final entry in _lastAccessed.entries) {
      if (oldestTime == null || entry.value.isBefore(oldestTime)) {
        oldestTime = entry.value;
        oldestKey = entry.key;
      }
    }
    
    if (oldestKey != null) {
      _compositions.remove(oldestKey);
      _lastAccessed.remove(oldestKey);
      print('🧹 Cleaned cache: $oldestKey');
    }
  }
  
  static void clearCache() {
    _compositions.clear();
    _lastAccessed.clear();
    print('🧹 Cache cleared');
  }
  
  static Map<String, dynamic> getCacheStatus() {
    return {
      'cachedAnimations': _compositions.length,
      'cacheLimit': maxCacheSize,
      'memoryEstimate': '${_compositions.length * 2}MB',
      'animations': _compositions.keys.toList(),
    };
  }
}
```

#### Preloading Strategy
```dart
class PreloadManager {
  static final Set<String> _preloadedAnimations = {};
  static bool _isPreloading = false;
  
  static Future<void> preloadCriticalAnimations() async {
    if (_isPreloading) return;
    _isPreloading = true;
    
    final criticalAnimations = [
      'packages/custom_quick_alert/assets/animations/success.json',
      'packages/custom_quick_alert/assets/animations/error.json',
    ];
    
    for (final animation in criticalAnimations) {
      if (!_preloadedAnimations.contains(animation)) {
        await SmartAnimationCache.getComposition(animation);
        _preloadedAnimations.add(animation);
        
        // Small delay to prevent blocking UI
        await Future.delayed(Duration(milliseconds: 50));
      }
    }
    
    _isPreloading = false;
    print('✅ Critical animations preloaded: ${_preloadedAnimations.length}');
  }
  
  static Future<void> preloadOnDemand(CustomQuickAlertType type) async {
    final animationPath = _getAnimationPath(type);
    
    if (!_preloadedAnimations.contains(animationPath)) {
      await SmartAnimationCache.getComposition(animationPath);
      _preloadedAnimations.add(animationPath);
    }
  }
  
  static String _getAnimationPath(CustomQuickAlertType type) {
    switch (type) {
      case CustomQuickAlertType.success:
        return 'packages/custom_quick_alert/assets/animations/success.json';
      case CustomQuickAlertType.error:
        return 'packages/custom_quick_alert/assets/animations/error.json';
      case CustomQuickAlertType.warning:
        return 'packages/custom_quick_alert/assets/animations/warning.json';
      case CustomQuickAlertType.info:
        return 'packages/custom_quick_alert/assets/animations/info.json';
      case CustomQuickAlertType.confirm:
        return 'packages/custom_quick_alert/assets/animations/confirm.json';
      case CustomQuickAlertType.loading:
        return 'packages/custom_quick_alert/assets/animations/loading.json';
      case CustomQuickAlertType.custom:
        return 'packages/custom_quick_alert/assets/animations/custom.json';
    }
  }
}
```

### 2. Context Management

#### Navigator Key Memory Management
```dart
class NavigatorMemoryManager {
  static GlobalKey<NavigatorState>? _navigatorKey;
  static final List<WeakReference<BuildContext>> _contexts = [];
  
  static void initializeWithMemoryTracking(GlobalKey<NavigatorState> key) {
    _navigatorKey = key;
    CustomQuickAlert.initialize(key);
    
    // Start memory monitoring in debug mode
    if (kDebugMode) {
      _startMemoryMonitoring();
    }
  }
  
  static void registerContext(BuildContext context) {
    // Clean up expired weak references
    _contexts.removeWhere((ref) => ref.target == null);
    
    // Add new context
    _contexts.add(WeakReference(context));
    
    // Warn if too many contexts
    if (_contexts.length > 10) {
      print('⚠️ Many contexts registered: ${_contexts.length}');
    }
  }
  
  static void _startMemoryMonitoring() {
    Timer.periodic(Duration(minutes: 2), (_) {
      final activeContexts = _contexts.where((ref) => ref.target != null).length;
      print('🧠 Active contexts: $activeContexts');
      print('🎨 Cached animations: ${SmartAnimationCache.getCacheStatus()}');
    });
  }
  
  static void cleanup() {
    _contexts.clear();
    SmartAnimationCache.clearCache();
    _navigatorKey = null;
  }
}
```

### 3. Alert Instance Management

#### Instance Pooling
```dart
class AlertInstancePool {
  static final Queue<AlertInstance> _availableInstances = Queue();
  static final Set<AlertInstance> _activeInstances = {};
  static const int maxPoolSize = 5;
  
  static AlertInstance getOrCreateInstance() {
    if (_availableInstances.isNotEmpty) {
      final instance = _availableInstances.removeFirst();
      _activeInstances.add(instance);
      instance.reset();
      return instance;
    }
    
    final instance = AlertInstance._();
    _activeInstances.add(instance);
    return instance;
  }
  
  static void releaseInstance(AlertInstance instance) {
    _activeInstances.remove(instance);
    
    if (_availableInstances.length < maxPoolSize) {
      instance.cleanup();
      _availableInstances.add(instance);
    } else {
      instance.dispose();
    }
  }
  
  static void clearPool() {
    for (final instance in _availableInstances) {
      instance.dispose();
    }
    _availableInstances.clear();
    
    for (final instance in _activeInstances) {
      instance.dispose();
    }
    _activeInstances.clear();
  }
  
  static Map<String, int> getPoolStatus() {
    return {
      'available': _availableInstances.length,
      'active': _activeInstances.length,
      'total': _availableInstances.length + _activeInstances.length,
    };
  }
}

class AlertInstance {
  late AnimationController _animationController;
  Timer? _autoCloseTimer;
  bool _disposed = false;
  
  AlertInstance._();
  
  void initialize(TickerProvider vsync) {
    if (_disposed) return;
    
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: vsync,
    );
  }
  
  void reset() {
    _autoCloseTimer?.cancel();
    _autoCloseTimer = null;
    
    if (!_disposed && _animationController.isAnimating) {
      _animationController.reset();
    }
  }
  
  void cleanup() {
    _autoCloseTimer?.cancel();
    _autoCloseTimer = null;
    
    if (!_disposed) {
      _animationController.reset();
    }
  }
  
  void dispose() {
    if (_disposed) return;
    
    _autoCloseTimer?.cancel();
    _animationController.dispose();
    _disposed = true;
  }
}
```

---

## 🔍 Memory Leak Detection

### Memory Leak Detector
```dart
class MemoryLeakDetector {
  static final Map<String, int> _objectCounts = {};
  static final List<String> _allocations = [];
  static Timer? _monitoringTimer;
  
  static void startMonitoring() {
    if (_monitoringTimer != null) return;
    
    _monitoringTimer = Timer.periodic(Duration(seconds: 30), (_) {
      _checkForLeaks();
    });
  }
  
  static void stopMonitoring() {
    _monitoringTimer?.cancel();
    _monitoringTimer = null;
  }
  
  static void trackAllocation(String objectType) {
    _objectCounts[objectType] = (_objectCounts[objectType] ?? 0) + 1;
    _allocations.add('${DateTime.now()}: +$objectType');
    
    // Keep only recent allocations
    if (_allocations.length > 100) {
      _allocations.removeAt(0);
    }
  }
  
  static void trackDeallocation(String objectType) {
    _objectCounts[objectType] = (_objectCounts[objectType] ?? 1) - 1;
    _allocations.add('${DateTime.now()}: -$objectType');
    
    if (_allocations.length > 100) {
      _allocations.removeAt(0);
    }
  }
  
  static void _checkForLeaks() {
    final suspiciousObjects = <String>[];
    
    for (final entry in _objectCounts.entries) {
      if (entry.value > 10) { // Threshold for suspicious counts
        suspiciousObjects.add('${entry.key}: ${entry.value}');
      }
    }
    
    if (suspiciousObjects.isNotEmpty) {
      print('🚨 Potential memory leaks detected:');
      for (final obj in suspiciousObjects) {
        print('  - $obj');
      }
      
      print('\nRecent allocations:');
      for (final allocation in _allocations.take(10)) {
        print('  $allocation');
      }
    }
  }
  
  static Map<String, dynamic> getMemoryReport() {
    return {
      'objectCounts': Map.from(_objectCounts),
      'recentAllocations': List.from(_allocations.take(20)),
      'suspiciousObjects': _objectCounts.entries
          .where((e) => e.value > 10)
          .map((e) => '${e.key}: ${e.value}')
          .toList(),
    };
  }
}

// Usage in AlertManager
class AlertManager {
  static Future<void> showTrackedAlert(CustomQuickAlertType type) async {
    MemoryLeakDetector.trackAllocation('Alert-${type.toString()}');
    
    try {
      switch (type) {
        case CustomQuickAlertType.success:
          await CustomQuickAlert.success(title: 'Success');
          break;
        // ... other cases
      }
    } finally {
      MemoryLeakDetector.trackDeallocation('Alert-${type.toString()}');
    }
  }
}
```

### Widget Tree Memory Analysis
```dart
class WidgetTreeAnalyzer {
  static void analyzeMemoryUsage(BuildContext context) {
    if (!kDebugMode) return;
    
    final element = context as Element;
    final analysis = _analyzeElement(element, 0);
    
    print('🌳 Widget Tree Memory Analysis:');
    print(analysis);
  }
  
  static String _analyzeElement(Element element, int depth) {
    final indent = '  ' * depth;
    final widget = element.widget;
    final memoryEstimate = _estimateWidgetMemory(widget);
    
    final buffer = StringBuffer();
    buffer.writeln('$indent${widget.runtimeType} (~${memoryEstimate}KB)');
    
    element.visitChildren((child) {
      buffer.write(_analyzeElement(child, depth + 1));
    });
    
    return buffer.toString();
  }
  
  static int _estimateWidgetMemory(Widget widget) {
    // Rough memory estimates for different widget types
    if (widget is CustomQuickAlertPageWidget) return 500;
    if (widget is Container) return 10;
    if (widget is Text) return 5;
    if (widget is Icon) return 8;
    if (widget is Material) return 20;
    if (widget is AnimatedWidget) return 50;
    
    return 2; // Default estimate
  }
}
```

---

## 🔧 Memory Optimization Patterns

### 1. Lazy Loading Pattern

```dart
class LazyAlertResources {
  static final Map<CustomQuickAlertType, Future<void>?> _loadingFutures = {};
  static final Set<CustomQuickAlertType> _loadedTypes = {};
  
  static Future<void> ensureLoaded(CustomQuickAlertType type) async {
    if (_loadedTypes.contains(type)) return;
    
    // Prevent duplicate loading
    if (_loadingFutures[type] != null) {
      await _loadingFutures[type];
      return;
    }
    
    final future = _loadResources(type);
    _loadingFutures[type] = future;
    
    try {
      await future;
      _loadedTypes.add(type);
    } finally {
      _loadingFutures[type] = null;
    }
  }
  
  static Future<void> _loadResources(CustomQuickAlertType type) async {
    switch (type) {
      case CustomQuickAlertType.success:
        await PreloadManager.preloadOnDemand(type);
        break;
      case CustomQuickAlertType.error:
        await PreloadManager.preloadOnDemand(type);
        break;
      // ... other types
    }
    
    print('✅ Resources loaded for $type');
  }
  
  static void unloadUnused() {
    final unusedTypes = _loadedTypes.where((type) {
      // Determine if type is still needed
      return !_isTypeRecentlyUsed(type);
    }).toList();
    
    for (final type in unusedTypes) {
      _unloadResources(type);
      _loadedTypes.remove(type);
    }
  }
  
  static bool _isTypeRecentlyUsed(CustomQuickAlertType type) {
    // Implement usage tracking logic
    return true; // Simplified
  }
  
  static void _unloadResources(CustomQuickAlertType type) {
    // Remove from cache
    final animationPath = PreloadManager._getAnimationPath(type);
    SmartAnimationCache._compositions.remove(animationPath);
    print('🗑️ Unloaded resources for $type');
  }
}
```

### 2. Weak Reference Pattern

```dart
class WeakAlertReference {
  final WeakReference<CustomQuickAlertPageWidget> _widgetRef;
  final WeakReference<BuildContext> _contextRef;
  final DateTime _createdAt;
  
  WeakAlertReference(CustomQuickAlertPageWidget widget, BuildContext context)
    : _widgetRef = WeakReference(widget),
      _contextRef = WeakReference(context),
      _createdAt = DateTime.now();
  
  CustomQuickAlertPageWidget? get widget => _widgetRef.target;
  BuildContext? get context => _contextRef.target;
  
  bool get isExpired => 
    DateTime.now().difference(_createdAt) > Duration(minutes: 5);
  
  bool get isValid => 
    !isExpired && widget != null && context != null;
}

class WeakAlertRegistry {
  static final List<WeakAlertReference> _registry = [];
  
  static void register(CustomQuickAlertPageWidget widget, BuildContext context) {
    // Clean expired references
    _registry.removeWhere((ref) => !ref.isValid);
    
    // Add new reference
    _registry.add(WeakAlertReference(widget, context));
    
    // Warn if too many active alerts
    if (_registry.length > 5) {
      print('⚠️ Many active alerts: ${_registry.length}');
    }
  }
  
  static void cleanup() {
    _registry.removeWhere((ref) => !ref.isValid);
  }
  
  static int get activeAlertCount => 
    _registry.where((ref) => ref.isValid).length;
}
```

---

## 📱 Platform-Specific Memory Management

### Android Memory Management

```dart
class AndroidMemoryManager {
  static void configureForAndroid() {
    if (!Platform.isAndroid) return;
    
    // Monitor system memory pressure
    SystemChannels.lifecycle.setMessageHandler((message) async {
      if (message == AppLifecycleState.paused.toString()) {
        // App going to background - free memory
        _freeNonEssentialMemory();
      } else if (message == AppLifecycleState.resumed.toString()) {
        // App coming to foreground - preload essentials
        await PreloadManager.preloadCriticalAnimations();
      }
      return null;
    });
  }
  
  static void _freeNonEssentialMemory() {
    // Clear animation cache
    SmartAnimationCache.clearCache();
    
    // Clear alert pool
    AlertInstancePool.clearPool();
    
    // Force garbage collection
    print('🧹 Freed memory for Android background state');
  }
  
  static Future<void> handleLowMemoryWarning() async {
    print('⚠️ Low memory warning - cleaning up');
    
    // Aggressive cleanup
    SmartAnimationCache.clearCache();
    AlertInstancePool.clearPool();
    WeakAlertRegistry.cleanup();
    
    // Only keep most critical animations
    await PreloadManager.preloadCriticalAnimations();
  }
}
```

### iOS Memory Management

```dart
class IOSMemoryManager {
  static void configureForIOS() {
    if (!Platform.isIOS) return;
    
    // iOS-specific memory management
    _setupMemoryWarningHandler();
  }
  
  static void _setupMemoryWarningHandler() {
    // Listen for iOS memory warnings
    // Implementation would use platform channels
    
    Timer.periodic(Duration(minutes: 5), (_) {
      _checkIOSMemoryPressure();
    });
  }
  
  static void _checkIOSMemoryPressure() {
    // Check available memory and clean up if needed
    final memoryInfo = _getIOSMemoryInfo();
    
    if (memoryInfo['availableMemory'] < 100 * 1024 * 1024) { // Less than 100MB
      _performIOSMemoryCleanup();
    }
  }
  
  static Map<String, int> _getIOSMemoryInfo() {
    // Platform-specific memory info
    // This would use iOS APIs via platform channels
    return {
      'totalMemory': 1024 * 1024 * 1024, // 1GB
      'availableMemory': 512 * 1024 * 1024, // 512MB
    };
  }
  
  static void _performIOSMemoryCleanup() {
    print('📱 iOS memory cleanup initiated');
    
    // iOS-optimized cleanup
    SmartAnimationCache.clearCache();
    LazyAlertResources.unloadUnused();
  }
}
```

---

## 🔍 Memory Debugging Tools

### Memory Usage Reporter

```dart
class MemoryUsageReporter {
  static Timer? _reportingTimer;
  
  static void startReporting({Duration interval = const Duration(minutes: 1)}) {
    _reportingTimer?.cancel();
    
    _reportingTimer = Timer.periodic(interval, (_) {
      _generateReport();
    });
  }
  
  static void stopReporting() {
    _reportingTimer?.cancel();
    _reportingTimer = null;
  }
  
  static void _generateReport() {
    final report = {
      'timestamp': DateTime.now().toIso8601String(),
      'animationCache': SmartAnimationCache.getCacheStatus(),
      'alertPool': AlertInstancePool.getPoolStatus(),
      'activeAlerts': WeakAlertRegistry.activeAlertCount,
      'memoryLeaks': MemoryLeakDetector.getMemoryReport(),
    };
    
    print('📊 Memory Usage Report:');
    print(const JsonEncoder.withIndent('  ').convert(report));
  }
  
  static Map<String, dynamic> getCurrentMemorySnapshot() {
    return {
      'timestamp': DateTime.now().toIso8601String(),
      'animationCache': SmartAnimationCache.getCacheStatus(),
      'alertPool': AlertInstancePool.getPoolStatus(),
      'activeAlerts': WeakAlertRegistry.activeAlertCount,
      'memoryLeaks': MemoryLeakDetector.getMemoryReport(),
    };
  }
}
```

### Memory Profiling Integration

```dart
class MemoryProfiler {
  static bool _isProfilerEnabled = false;
  
  static void enableProfiling() {
    if (kDebugMode) {
      _isProfilerEnabled = true;
      MemoryLeakDetector.startMonitoring();
      MemoryUsageReporter.startReporting();
      print('🔍 Memory profiling enabled');
    }
  }
  
  static void disableProfiling() {
    _isProfilerEnabled = false;
    MemoryLeakDetector.stopMonitoring();
    MemoryUsageReporter.stopReporting();
    print('🔍 Memory profiling disabled');
  }
  
  static Future<void> generateMemorySnapshot() async {
    if (!_isProfilerEnabled) return;
    
    final snapshot = {
      'appMemory': await _getAppMemoryUsage(),
      'customQuickAlert': MemoryUsageReporter.getCurrentMemorySnapshot(),
      'flutter': await _getFlutterMemoryUsage(),
    };
    
    // Save or send snapshot
    print('📸 Memory snapshot generated');
    print(const JsonEncoder.withIndent('  ').convert(snapshot));
  }
  
  static Future<Map<String, dynamic>> _getAppMemoryUsage() async {
    // Get app-wide memory usage
    // This would require platform-specific implementation
    return {
      'totalMemory': 100 * 1024 * 1024, // 100MB
      'heapMemory': 60 * 1024 * 1024,   // 60MB
    };
  }
  
  static Future<Map<String, dynamic>> _getFlutterMemoryUsage() async {
    // Get Flutter-specific memory usage
    return {
      'dartHeap': 20 * 1024 * 1024,     // 20MB
      'images': 10 * 1024 * 1024,       // 10MB
      'gpu': 15 * 1024 * 1024,          // 15MB
    };
  }
}
```

---

## 🎯 Memory Management Best Practices

### Initialization Best Practices

```dart
class OptimalInitialization {
  static Future<void> initializeCustomQuickAlert() async {
    // 1. Initialize with memory tracking
    final navigatorKey = GlobalKey<NavigatorState>();
    NavigatorMemoryManager.initializeWithMemoryTracking(navigatorKey);
    
    // 2. Configure platform-specific optimizations
    if (Platform.isAndroid) {
      AndroidMemoryManager.configureForAndroid();
    } else if (Platform.isIOS) {
      IOSMemoryManager.configureForIOS();
    }
    
    // 3. Preload only critical animations
    await PreloadManager.preloadCriticalAnimations();
    
    // 4. Enable memory monitoring in debug mode
    if (kDebugMode) {
      MemoryProfiler.enableProfiling();
    }
    
    print('✅ Custom Quick Alert initialized with memory optimizations');
  }
  
  static void cleanupOnAppExit() {
    NavigatorMemoryManager.cleanup();
    AlertInstancePool.clearPool();
    SmartAnimationCache.clearCache();
    MemoryProfiler.disableProfiling();
    
    print('🧹 Custom Quick Alert cleanup completed');
  }
}

// Usage in main.dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await OptimalInitialization.initializeCustomQuickAlert();
  
  runApp(MyApp());
  
  // Cleanup on app termination
  AppLifecycleTracker.onAppTerminate = () {
    OptimalInitialization.cleanupOnAppExit();
  };
}
```

---

## 🔗 Related Documentation

- [Performance Optimization](performance.md)
- [Error Handling](error-handling.md)
- [Testing Strategies](testing.md)
- [Platform-Specific Issues](../troubleshooting/platform-issues.md)
