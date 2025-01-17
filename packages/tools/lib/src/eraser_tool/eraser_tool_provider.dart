import 'package:command/command_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tools/tools.dart';

part 'eraser_tool_provider.g.dart';

@riverpod
BrushTool eraserTool(EraserToolRef ref) {
  return BrushTool(
    paint: ref.watch(brushToolStateProvider.select((state) => state.paint)),
    type: ToolType.ERASER,
    commandManager: ref.watch(commandManagerProvider),
    commandFactory: ref.watch(commandFactoryProvider),
    graphicFactory: ref.watch(graphicFactoryProvider),
  );
}
