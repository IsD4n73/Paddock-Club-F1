import "package:flutter/material.dart";

class NoDataPilot extends StatelessWidget {
  const NoDataPilot({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          "Non sono presenti dati sui piloti...",
          style: TextStyle(
            fontFamily: "F1Bold",
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class NoDataSession extends StatelessWidget {
  const NoDataSession({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          "Non sono presenti dati sulla sessione...",
          style: TextStyle(
            fontFamily: "F1Bold",
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class NoDataConstructor extends StatelessWidget {
  const NoDataConstructor({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          "Non sono presenti dati sui costruttori...",
          style: TextStyle(
            fontFamily: "F1Bold",
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
