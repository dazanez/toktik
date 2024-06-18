import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:toktik/config/helpers/human_formats.dart';
import 'package:toktik/domain/entities/video_post.dart';

const Color defaultIconColor = Colors.white;

class VideoButtons extends StatelessWidget {
  final VideoPost video;

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _CustomIconButton(
          value: video.likes,
          iconData: Icons.favorite,
          iconColorSwitch: Colors.red,
          switchedBydefault: true,
        ),
        _CustomIconButton(
            value: video.views, iconData: Icons.remove_red_eye_outlined),
        SpinPerfect(
            infinite: true,
            duration: const Duration(seconds: 5),
            child: const _CustomIconButton(
                value: 0, iconData: Icons.play_circle_outline))
      ],
    );
  }
}

class _CustomIconButton extends StatefulWidget {
  final int value;
  final IconData iconData;
  final Color color;
  final Color? colorSwitch;
  final bool isSwitchedByDefault;

  const _CustomIconButton(
      {required this.value, required this.iconData, bool switchedBydefault = false, Color? iconColor, Color? iconColorSwitch})
      : color = iconColor ?? defaultIconColor,
        colorSwitch = iconColorSwitch,
        isSwitchedByDefault = switchedBydefault ? (iconColorSwitch != null) : false;

  @override
  State<_CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<_CustomIconButton> {
  late Color color;

  @override
  void initState() {
    super.initState();

    color = widget.isSwitchedByDefault ? widget.colorSwitch! : widget.color;
  }

  @override
  Widget build(BuildContext context) {
    final bool switchesColors = widget.colorSwitch != null;

    return Column(
      children: [
        IconButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                    Color.fromARGB(40, 0, 0, 0))),
            enableFeedback: false,
            onPressed: switchesColors
                ? () => setState(() {
                      color = color == widget.color
                          ? widget.colorSwitch!
                          : widget.color;
                    })
                : () => (),
            icon: Icon(
              widget.iconData,
              color: color,
              size: 30,
            )),
        if (widget.value > 0)
          Text(HumanFormats.humanReadableNumber(widget.value.toDouble())),
        if (widget.value > 0)
          const SizedBox(
            height: 20,
          )
      ],
    );
  }
}
