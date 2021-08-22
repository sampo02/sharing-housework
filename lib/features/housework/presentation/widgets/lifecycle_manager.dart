import 'package:flutter/widgets.dart';
import 'package:sharing_housework/features/housework/presentation/models/user_model.dart';

class LifecycleManager extends StatefulWidget {
  final Widget child;
  final UserModel user;
  const LifecycleManager({required this.child, required this.user, Key? key})
      : super(key: key);

  @override
  _LifecycleManagerState createState() => _LifecycleManagerState();
}

class _LifecycleManagerState extends State<LifecycleManager>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      widget.user.handleDeepLink();
    }
  }

  @override
  Widget build(BuildContext context) {
    widget.user.handleDeepLink();
    return Container(
      child: widget.child,
    );
  }
}
