String dateToString(DateTime date) {
  return '${date.year.toString().padLeft(4, '0')}年'
      '${date.month.toString().padLeft(2, '0')}月'
      '${date.day.toString().padLeft(2, '0')}日'
      '${date.hour.toString().padLeft(2, '0')}時'
      '${date.minute.toString().padLeft(2, '0')}分'
      '${date.second.toString().padLeft(2, '0')}秒';
}
