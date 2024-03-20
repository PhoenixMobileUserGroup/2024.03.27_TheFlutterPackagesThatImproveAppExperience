import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:packages_meetup_demo/models/pokemon.dart';

class PokemonDetailsDialog extends StatefulWidget {
  const PokemonDetailsDialog({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  State<PokemonDetailsDialog> createState() => _PokemonDetailsDialogState();
}

class _PokemonDetailsDialogState extends State<PokemonDetailsDialog>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  bool isStartupAnimationRunning = true;

  @override
  void initState() {
    _controller = AnimationController(vsync: this)
      ..addListener(() async {
        if (_controller.isCompleted) {
          await Future.delayed(const Duration(milliseconds: 250));
          setState(() {
            isStartupAnimationRunning = false;
          });
        }
      });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Text(widget.pokemon.name,
                        style: Theme.of(context).textTheme.headlineLarge)),
                Text("#${widget.pokemon.id}",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Theme.of(context).colorScheme.secondary)),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * .25,
                        child: isStartupAnimationRunning
                            ? Lottie.asset(
                                'assets/lottie/pokeball.json',
                                controller: _controller,
                                onLoaded: (LottieComposition composition) {
                                  // Configure the AnimationController with the duration of the
                                  // Lottie file and start the animation.
                                  _controller
                                    ..duration = composition.duration
                                    ..forward();
                                },
                              )
                            : CachedNetworkImage(
                                fit: BoxFit.fitHeight,
                                imageUrl: widget.pokemon.sprite,
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Center(child: FaIcon(FontAwesomeIcons.circleExclamation)),
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
