// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito, -apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// 전역으로 labels와 data를 선언
var labels = [];
var data = [];

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart;
var totalDogCounts;

$.ajax({
	  url: '/totalDogCounts', // 실제 API 엔드포인트로 대체
	  method: 'GET',
	  success: function(response) {
		  totalDogCounts = response;
	  }
});

$.ajax({
  url: '/topDogCounts', // 실제 API 엔드포인트로 대체
  method: 'GET',
  success: function(response) {
    // 서버에서 받은 데이터를 가공하여 labels와 data 배열에 할당합니다.
    for (var i = 0; i < response.length; i++) {
      labels.push(response[i].dtype);
      data.push(response[i].dogCount);
      totalDogCounts -= response[i].dogCount;
    }

    labels.push("기타");
    data.push(totalDogCounts);

    // 차트 생성
    myPieChart = new Chart(ctx, {
      type: 'doughnut',
      data: {
        labels: labels,
        datasets: [{
          data: data,
          backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#f6c23e', '#858796'],
          hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
          hoverBorderColor: "rgba(234, 236, 244, 1)",
        }],
      },
      options: {
        maintainAspectRatio: false,
        tooltips: {
          backgroundColor: "rgb(255,255,255)",
          bodyFontColor: "#858796",
          borderColor: '#dddfeb',
          borderWidth: 1,
          xPadding: 15,
          yPadding: 15,
          displayColors: false,
          caretPadding: 10,
        },
        legend: {
          display: false
        },
        cutoutPercentage: 80,
      },
    });
  },
  error: function(error) {
    console.error('Error fetching data:', error);
  }
});

////Set new default font family and font color to mimic Bootstrap's default styling
//Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
//Chart.defaults.global.defaultFontColor = '#858796';
//
//// Pie Chart Example
//var ctx = document.getElementById("myPieChart");
//var myPieChart = new Chart(ctx, {
//  type: 'doughnut',
//  data: {
//    labels: ["Direct", "Referral", "Social"],
//    datasets: [{
//      data: [55, 30, 15],
//      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
//      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
//      hoverBorderColor: "rgba(234, 236, 244, 1)",
//    }],
//  },
//  options: {
//    maintainAspectRatio: false,
//    tooltips: {
//      backgroundColor: "rgb(255,255,255)",
//      bodyFontColor: "#858796",
//      borderColor: '#dddfeb',
//      borderWidth: 1,
//      xPadding: 15,
//      yPadding: 15,
//      displayColors: false,
//      caretPadding: 10,
//    },
//    legend: {
//      display: false
//    },
//    cutoutPercentage: 80,
//  },
//});

