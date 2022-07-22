import 'package:samplecliapp/cli_commands/general/start_cli_command.dart';
import 'package:samplecliapp/cli_utils/logger.dart';

void main(List<String> args) {
  final mainCommand = StartCliCommand();
  Logger.warn(mainCommand.name);

  mainCommand.executeInMicroTask();
}
