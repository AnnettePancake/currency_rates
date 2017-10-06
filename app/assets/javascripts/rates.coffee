window.Rates = {}

Rates.init = (type) ->
  Highcharts.chart "#{type}_rates",
    chart: zoomType: 'x'
    title: text: "USD and EUR to RUB #{type} rates for 24 hours"
    subtitle: text: 'Source: <a href="https://www.tinkoff.ru">' + 'tinkoff.ru</a>'
    xAxis:
      type: 'category',
    yAxis:
      title: text: 'Rates'
    tooltip: pointFormat: "<b>#{type}</b> {series.name} is <b>{point.y}</b><br/>"
    plotOptions: area:
      marker:
        enabled: false
        symbol: 'circle'
        radius: 2
        states: hover: enabled: true
    series: [
      gon["usd_#{type}_rates"]
      gon["eur_#{type}_rates"]
    ]

$(document).ready ->
  Rates.init('buy');
  Rates.init('sell');
