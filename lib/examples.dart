import 'components/question_preview.dart';
import 'models/tag.dart';

class Examples {
  static List<Tag> tagSamples = [
    Tag(id: 1, name: "плавание", color: "grey"),
    Tag(id: 1, name: "вязание", color: "grey"),
    Tag(id: 1, name: "IT", color: "grey"),
    Tag(id: 1, name: "вышивание", color: "grey"),
    Tag(id: 1, name: "бекенд", color: "grey"),
    Tag(id: 1, name: "спорт", color: "grey"),
    Tag(id: 1, name: "дизайн", color: "grey"),
    Tag(id: 1, name: "книги", color: "grey"),
  ];

  static List<QuestionPreview> questionSamples = [
    QuestionPreview(
      authorName: "Евгений",
      authorSurname: "Моховской",
      title: "Что делать если на тебя напал дикий еж?",
      description: "В лесу встретил злого ежа. \nЧто делать?",
      tags: [Tag(id: 0, name: " #дикие животные ", color: "grey")],
      answersCount: 11,
    ),
    QuestionPreview(
      authorName: "Марина",
      authorSurname: "Тарчинская",
      title: "Как приготовить настоящий узбекский плов?",
      description: "Плов хочу как в Узбекистане. \nКак такое готовить?",
      tags: [
        Tag(id: 0, name: " #кулинария ", color: "grey"),
        Tag(id: 1, name: " #еда ", color: "grey"),
        Tag(id: 0, name: " #национальная кухня ", color: "grey"),
      ],
      answersCount: 11,
    ),
    QuestionPreview(
      authorName: "Арсений",
      authorSurname: "Калиниченко",
      title: "Как создать звезду смерти?",
      description: "На меня голуби в парке напали. Хочу отомстить!",
      tags: [
        Tag(id: 4, name: " #инженерия ", color: "grey"),
        Tag(id: 6, name: " #философия ", color: "grey")
      ],
      answersCount: 217,
    ),
  ];
}
