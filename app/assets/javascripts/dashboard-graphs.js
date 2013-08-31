// google.load("visualization", "1", {packages:["corechart"]});
//   google.setOnLoadCallback(drawChart);

//   function drawChart() {
//     var total_events_data = google.visualization.arrayToDataTable([
//       ['Month', 'Events'],
//       ['2004',  1000],
//       ['2005',  1170],
//       ['2006',  660],
//       ['2007',  1030]
//     ]);

//     var events_tag_data = google.visualization.arrayToDataTable([
//       ['Tag', 'beer', 'family-friendly',  'music', 'art'],
//       ['count', 1250,  1170,               200,      1500]
//     ]);

//     var requests_day_data = google.visualization.arrayToDataTable([
//       ['Month', 'Requests'],
//       ['8/28',  1000],
//       ['8/29',  1170],
//       ['8/30',  660],
//       ['8/31',  1030],
//       ['9/1',  1200],
//       ['9/2',  800],
//       ['9/3',  900],
//       ['9/4',  1250],
//       ['9/5',  1400]
//     ]);

//     var cumul_requests_day_data = google.visualization.arrayToDataTable([
//       ['Month', 'Requests'],
//       ['8/28',  1000],
//       ['8/29',  2170],
//       ['8/30',  2830],
//       ['8/31',  3960],
//       ['9/1',  5160],
//       ['9/2',  5960],
//       ['9/3',  6860],
//       ['9/4',  8910],
//       ['9/5',  10310]
//     ]);

//     var requests_validations_data = google.visualization.arrayToDataTable([
//       ['Month', 'Requests', 'Validations'],
//       ['Count',  4000,       3500]
//     ]);

//     var total_events_options = {
//       title: 'Total Events By Month',
//       vAxis: {title: 'Month',  titleTextStyle: {color: 'red'}},
//       backgroundColor: '#ECF0F1',
//       legend: {position: 'bottom'},
//       height: 200
//     };

//     var events_tag_options = {
//       title: 'Total Events By Tag',
//       vAxis: {title: 'Tag',  titleTextStyle: {color: 'red'}},
//       backgroundColor: '#ECF0F1',
//       legend: {position: 'bottom'},
//       height: 200
//     };

//     var requests_day_options = {
//       title: 'Requests Per Day',
//       vAxis: {title: 'Tag',  titleTextStyle: {color: 'red'}},
//       backgroundColor: '#ECF0F1',
//       legend: {position: 'none'},
//       height: 200
//     };

//     var cumul_requests_day_options = {
//       title: 'Cumulative Requests Over Time',
//       vAxis: {title: 'Tag',  titleTextStyle: {color: 'red'}},
//       backgroundColor: '#ECF0F1',
//       legend: {position: 'none'},
//       height: 200
//     };

//     var requests_validations_options = {
//       title: 'Total Requests vs. Validations',
//       vAxis: {title: 'Tag',  titleTextStyle: {color: 'red'}},
//       backgroundColor: '#ECF0F1',
//       legend: {position: 'bottom'},
//       height: 200
//     };

//     var total_events_chart = new google.visualization.ColumnChart(document.getElementById('events_by_month'));
//     total_events_chart.draw(total_events_data, total_events_options);

//     // var total_events_chart = new google.visualization.ColumnChart(document.getElementById('events_by_tag'));
//     // total_events_chart.draw(events_tag_data, events_tag_options);

//     // var total_events_chart = new google.visualization.LineChart(document.getElementById('requests_by_day'));
//     // total_events_chart.draw(requests_day_data, requests_day_options);

//     // var total_events_chart = new google.visualization.LineChart(document.getElementById('cumul_requests_by_day'));
//     // total_events_chart.draw(cumul_requests_day_data, cumul_requests_day_options);

//     // var total_events_chart = new google.visualization.ColumnChart(document.getElementById('total_requests'));
//     // total_events_chart.draw(requests_validations_data, requests_validations_options);
// }