jQuery(document).ready(function() {
	Record.init();
});
/* ================================================================================ */
var MyPage = function() {
	var initPageStyle = function() {
		$(".page-content-single").css("background-color","#fff");
		$(".page-content-single").css("margin-left","0px");
		$(".page-content-single").css("margin-top","0px");
		$(".page-content-single").css("min-height","600px");
		$(".page-content-single").css("padding","25px 20px 10px 20px");
	}
	return {
		init: function() {
			initPageStyle();
			initLeftMenu("gis");
		}
	};
}();
var Record = function() {
	var html="";
	var initRecordStyle = function() {
	};
	var gamer=new Array();
	$.getJSON("get_record.jsp?device_id=001",
		     function(data) {
		var i=0;
		while(data.aaData[i][0]==1){
			gamer[i]=data.aaData[i][1];
			i++;
		}
	
	});
	
	var initRecordList=function(){
		$('.datatable').dataTable( {
			"paging":true,
			"searching":false,
			"oLanguage": {
				"aria": {
					"sortAscending": ": activate to sort column ascending",
					"sortDescending": ": activate to sort column descending"
				},
				"sProcessing":   "处理中...",
				"sLengthMenu":   "_MENU_ 记录/页",
				"sZeroRecords":  "没有匹配的记录",
				"sInfo":         "显示第 _START_ 至 _END_ 项记录，共 _TOTAL_ 项",
				"sInfoEmpty":    "显示第 0 至 0 项记录，共 0 项",
				"sInfoFiltered": "(由 _MAX_ 项记录过滤)",
				"sInfoPostFix":  "",
				"sSearch":       "过滤:",
				"oPaginate": {
					"sFirst":    "首页",
					"sPrevious": "上页",
					"sNext":     "下页",
					"sLast":     "末页"
				}
			},
			"aoColumns": [{},{},{}],
			"aLengthMenu": [[5,10,15,20,25,40,50,-1],[5,10,15,20,25,40,50,"所有记录"]],
			"fnDrawCallback": function(){$(".checkboxes").uniform();$(".group-checkable").uniform();},
			//"sAjaxSource": "get_record.jsp"
			"sAjaxSource": "get_record2.jsp?device_id=001"
		});
		
		
		$.getJSON("get_record2.jsp?device_id=001",
			     function(data) {
			var myChart1 = echarts.init(document.getElementById('main1'));
			var myChart2 = echarts.init(document.getElementById('main2'));
			var t=new Array();
			var g=new Array(gamer.length).fill(0);
			
			var n=new Array();
			for(var i=0;i<data.aaData.length;i++){
				t[i]=data.aaData[i][0];
				n[i]=parseFloat(data.aaData[i][1]);
				for(var j=0;j<gamer.length;j++){
					if(data.aaData[i][2]==gamer[j])
						
						g[j]++;
				}
				
			}
			
			var option2 = {
					title: {
				        text: '赢家统计图'
				    },
				    toolbox: {
				        feature: {
				            saveAsImage: {}
				        }
				    },
				    xAxis: {
				        type: 'category',
				        data: gamer
				    },
				    yAxis: {
				    	minInterval: 1,
				        type: 'value'
				    },
				    series: [{
				        data: g,
				        type: 'bar'
				    }]
				};

			

		
			var option1 = {
				    title: {
				        text: '黄金点变化图'
				    },
				    

				    toolbox: {
				        feature: {
				            saveAsImage: {}
				        }
				    },
				    xAxis: {
				        type: 'category',
				        boundaryGap: false,
				        data: t
				    },
				    yAxis: {
				        type: 'value'
				    },
				    series: [
				        {
				            
				            type: 'line',
				            
				            data: n
				        }
				    ]
				};


			myChart1.setOption(option1);
			myChart2.setOption(option2);
			
			    //alert("ID:" + data.aaData);
			     });
		$('.datatable').find('.group-checkable').change(function () {
			var set = jQuery(this).attr("data-set");
			var checked = jQuery(this).is(":checked");
			jQuery(set).each(function () {
	            if (checked) {
	                $(this).attr("checked", true);
	                $(this).parents('tr').addClass("active");
	            } else {
	                $(this).attr("checked", false);
	                $(this).parents('tr').removeClass("active");
	            }
			});
			jQuery.uniform.update(set);
		});
		$('.datatable').on('change', 'tbody tr .checkboxes', function () {
			$(this).parents('tr').toggleClass("active");
		});
	}
	return {
		init: function() {
			initRecordList();
			initRecordStyle();
		}
	};
}();
