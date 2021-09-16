

var d = new Date();
let today = new Date();   

let year = today.getFullYear(); // 년도
let month = today.getMonth() + 1;  // 월
let date = today.getDate();  // 날짜
let day = today.getDay();  // 요일

document.write( monthNames[d.getMonth()]);
document.write("<br/>");
document.write(month);
document.write(" / ");
document.write(date);


