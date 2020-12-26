import 'package:web_scraper/web_scraper.dart';
import 'date.dart';

Future<List<Date>> initDateData() async {
  List<Date> dates = List<Date>(200);
  final rawUrl = 'https://conversationstartersworld.com/date-ideas/';
  final webScraper = WebScraper('https://conversationstartersworld.com');
  final endpoint =
      rawUrl.replaceAll(r'https://conversationstartersworld.com', '');
  if (await webScraper.loadWebPage(endpoint)) {
    final dateTitlesAsMap = webScraper.getElement('''
        div.entry-content > h3
        ''', []);
    final dateDescriptionsAsMap = webScraper.getElement('''
      div.entry-content > p
    ''', []);
    dateDescriptionsAsMap.removeRange(0, 15);
    dateDescriptionsAsMap.removeRange(
        dateDescriptionsAsMap.length - 7, dateDescriptionsAsMap.length);
    dateTitlesAsMap.forEach((element) {
      element['title'] = element['title'].replaceAll("\n", " ");
    });
    dateDescriptionsAsMap.forEach((element) {
      element['title'] = element['title'].replaceAll("\n", " ");
    });
    for (int i = 0; i < dates.length; i++) {
      dates[i] =
          Date(dateTitlesAsMap[i]['title'], dateDescriptionsAsMap[i]['title']);
    }
  } else {
    print('Cannot load url');
  }
  return dates;
}
