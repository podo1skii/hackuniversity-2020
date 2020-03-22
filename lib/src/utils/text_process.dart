const main_count = 25;


String namePipe(String text, {int width = main_count}){
  if (text.length > width){
    return text.substring(0,width-3)+'...';
  } else if (text.length > width-1) {
    return text.substring(0,width-4)+'..';
  } else if (text.length > width-2){
    return text.substring(0, width -5);
  } else{
    return text;
  }
}

String authorPipe(String author) => author == 'nan' ? 'Не указан': author;


String longNamePipe(String text) => text.length > 43 ? text.substring(0, 32) + '...': text;
