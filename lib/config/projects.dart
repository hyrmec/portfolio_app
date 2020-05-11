import 'package:portfolio/models/project_model.dart';
import 'assets.dart';

final List<Project> projects = [
  Project(
      name: '1RS',
      image: Assets.rs,
      description: 'First rieltor system',
      link: 'https://1rs.su'
  ),
  Project(
      name: 'SPN24',
      image: Assets.spn24,
      description: 'Service sales of new buildings',
      link: 'https://spn24.ru'
  ),
  Project(
      name: 'Balance-Platform',
      image: Assets.bp,
      description: 'BPM model in banks(Absolut, Zenit, Rosgosstrah)',
      link: 'balance-pl.ru'
  ),
];