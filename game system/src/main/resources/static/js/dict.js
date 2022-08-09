function showDictSelect(id, type, all) {
	var data = getDict(type);
	var select = $("#" + id);
	select.empty();
	console.log(type);
	var zhi;
	var xb = "xb";

	
	
	if (all != undefined && all) {
		select.append("<option value=''>全部</option>");
	}
	
	$.each(data, function(k, v) {
		select.append("<option value ='" + k + "'>" + v + "</option>");
	});

	return data;
}

function getDict(type) {
	var v = sessionStorage[type];
	if (v == null || v == "") {
		$.ajax({
			type : 'get',
			url : '/dicts?type=' + type,
			async : false,
			success : function(data) {
				v = {};
				$.each(data, function(i, d) {
					v[d.k] = d.val;
				});

				sessionStorage[type] = JSON.stringify(v);
			}
		});
	}

	return JSON.parse(sessionStorage[type]);
}

function getNowuser() {
	var zhxx;
	$.ajax({
		type: 'get',
		url: '/users/current',
		async: false,
		success: function(data) {
			zhxx = data
		}
	});
	
	return zhxx;
}

function getUser() {
	var user;
	$.ajax({
		type: 'get',
		url: '/users?user=' + "1",
		async: false,
		success: function(data) {
			v = {};
			$.each(data, function(i, d) {
				v[d.id] = d.nickname;
			});

			user = JSON.stringify(v);
		}
	});

	return JSON.parse(user);
}

function showUserSelect(id, type, all) {
	var data = getUser();
	var select = $("#" + id);
	select.empty();
	console.log(type);

	select.append("<option value =''>" + "请选择" + "</option>");

	if(all != undefined && all) {
		select.append("<option value=''>全部</option>");
	}

	$.each(data, function(id, v) {
		select.append("<option value ='" + id + "'>" + v + "</option>");
	});

	return data;
}
//function gstxk() {
////	var v = sessionStorage[type];
////	if (v == null || v == "") {
//	var xk;
//	$.ajax({
//		type : 'get',
//		url : '/xkbs?xk=' + "1",
//		async : false,
//		success : function(data) {
//			v = {};
//			$.each(data, function(i, d) {
//				v[d.id] = d.xkm;
//			});
//
//			xk = JSON.stringify(v);
//		}
//	});
////	}
//
//	return JSON.parse(xk);
//}
//
//function showXKSelect(id,type,all) {
//	var data = gstxk();
//	var select = $("#" + id);
//	select.empty();
//	console.log(type);
//	
//	select.append("<option value =''>" + "请选择" +  "</option>");
//	
//	if (all != undefined && all) {
//		select.append("<option value=''>全部</option>");
//	}
//	
//	$.each(data, function(id, v) {
//		select.append("<option value ='" + id + "'>" + v + "</option>");
//	});
//
//	return data;
//}