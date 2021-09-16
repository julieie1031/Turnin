

function getDateStr(myDate){
			return (myDate.getFullYear() + '-' + (myDate.getMonth() + 1) + '-' + myDate.getDate())
		}
		function lastWeek() {
		var monthNames = ["January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November", "December"];

			  var d = new Date()
			  var dayOfdate = d.getDate()
			  d.setDate(dayOfMonth - 1)
			  document.write( monthNames[d.getMonth()]);
document.write("<br/>");
document.write(month);
document.write(" / ");
document.write(date);
			}
