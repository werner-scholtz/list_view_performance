# list_view_performance

Improving the performance of a large list view with complex child widgets.

## Testing

Default ListView:
```
flutter drive --driver=test_driver/perf_driver.dart --target=integration_test/data_tile_test.dart -d Linux --profile
```


Custom RenderObject: 

```
flutter drive --driver=test_driver/perf_driver.dart --target=integration_test/custom_data_tile_test.dart -d Linux --profile
```


Output:

/performance_summary/...