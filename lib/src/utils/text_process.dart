const main_count = 25;


String namePipe(String text){
  if (text.length > main_count){
    return text.substring(0,main_count-3)+'...';
  } else if (text.length > main_count-1) {
    return text.substring(0,main_count-4)+'..';
  } else if (text.length > main_count-2){
    return text.substring(0, main_count -5);
  } else{
    return text;
  }
}

String authorPipe(String author) => author == 'nan' ? 'Не указан': author;
