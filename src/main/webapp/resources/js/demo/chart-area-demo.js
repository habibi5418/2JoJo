// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

var labels3 = [];
var data3 = [];

// Area Chart Example
var ctx3 = document.getElementById("myAreaChart");
var myAreaChart = new Chart(ctx3, {
  type: 'line',
  data: {
    labels: labels3, // 수정: labels3 배열을 사용
    datasets: [{
      label: "이용자수",
      lineTension: 0.3,
      backgroundColor: "rgba(78, 115, 223, 0.05)",
      borderColor: "rgba(78, 115, 223, 1)",
      pointRadius: 3,
      pointBackgroundColor: "rgba(78, 115, 223, 1)",
      pointBorderColor: "rgba(78, 115, 223, 1)",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
      pointHitRadius: 10,
      pointBorderWidth: 2,
      data: data3, // 수정: data3 배열을 사용
    }],
  },
  options: {
    maintainAspectRatio: false,
    layout: {
      padding: {
        left: 10,
        right: 25,
        top: 25,
        bottom: 0
      }
    },
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false,
          drawBorder: false
        },
        ticks: {
          maxTicksLimit: 7
        }
      }],
      yAxes: [{
        ticks: {
          beginAtZero: true,
          maxTicksLimit: 5,
          padding: 10,
          // Include a dollar sign in the ticks
          callback: function(value, index, values) {
              return Math.round(value) + '명';
          }
        },
        gridLines: {
          color: "rgb(234, 236, 244)",
          zeroLineColor: "rgb(234, 236, 244)",
          drawBorder: false,
          borderDash: [2],
          zeroLineBorderDash: [2]
        }
      }],
    },
    legend: {
      display: false
    },
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      titleMarginBottom: 10,
      titleFontColor: '#6e707e',
      titleFontSize: 14,
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      intersect: false,
      mode: 'index',
      caretPadding: 10,
      callbacks: {
        label: function(tooltipItem, chart) {
          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
          return datasetLabel + tooltipItem.yLabel + '명'; // 수정: number_format 함수 사용하지 않고 직접 값 반환
        }
      }
    }
  }
});
//최대 데이터 길이
var maxDataLength = 6; 


// 주기적으로 업데이트하는 함수 시간
function updateDataAndChart() {
    // 현재 시간을 labels3에 추가
    var currentDate = new Date();
    var currentDateTimeString = currentDate.toLocaleString(); // 로컬 시간으로 변환
    labels3.push(currentDateTimeString);

    // 내 데이터에서 이용자 수 가져오기
    getTotalWalkCnt(); // 수정: getTotalWalkCnt 함수 호출

    // 차트 업데이트 함수 호출
    updateChart3(labels3, data3);
}


//임의로 데이터 넣기
//function getTotalWalkCnt() {
//    // 랜덤한 값을 data3 배열에 추가
//    var randomWalkCnt = Math.floor(Math.random() * (2000 - 500 + 1)) + 500;
//    data3.push(randomWalkCnt);
//
//    // 데이터 길이가 최대 길이보다 크면 맨 앞 데이터 삭제
//    if (data3.length > maxDataLength) {
//        labels3.shift();
//        data3.shift();
//    }
//    
//    updateChart3(labels3, data3);
//}
//updateDataAndChart();
function getTotalWalkCnt() {
    fetch(getTotalWalkCntUrl, {
       method: "GET",
       headers: {
           "Content-Type": "application/json; charset=UTF-8",
       },
    })
    .then((response) => response.json())
    .then((json) => {

	    // 날짜와 산책량을 배열에 추가
	    data3.push(json.totalWalkCnt);
  	
	    // 데이터 길이가 최대 길이보다 크면 맨 앞 데이터 삭제
        if (data3.length > maxDataLength) {
            labels3.shift();
            data3.shift();
        }
            
	    updateChart3(labels3, data3);
    });
 }
updateDataAndChart();

function updateChart3(labels, data) {
    // 기존 차트 데이터 업데이트
	myAreaChart.data.labels = labels;
	myAreaChart.data.datasets[0].data = data;
	myAreaChart.update(); // 차트 업데이트
}
// 일정한 주기로 updateDataAndChart 함수 호출
setInterval(updateDataAndChart, 5000); // 5000ms 마다 업데이트 (5초 간격)