var replyService = (function() {
    const host = "/replies/"
    function countUp() {
        return ++idx;
    }
    function addReply(obj, callback) {
        $.ajax({
            type:"post",
            url:host+"new",
            data:JSON.stringify(obj),
            contentType:"application/json",
            success: function () {
                if(callback){
                    callback();
                }
            }
        })
    }
    function getList(bno, callback) {
        $.getJSON(host+bno+"/1.json",
            null,
            function (arr) {
                if (callback){
                    callback(arr)
                }
            })
    }
    function getReply(rno, callback) {
        $.getJSON(host+rno+".json",
            null,
            function (arr) {
                if (callback){
                    callback(arr)
                }
            })
    }
    function removeReply(rno, callback){
    	$.ajax({
            type:"delete",
            url: host+rno,            
            success: function(){
                if(callback){
                    callback();
                }
            }
          })
    }
    function updateReply(obj, callback){
    	$.ajax({
    		type:"put",
    		url: host+obj.rno,
    		data:JSON.stringify(obj),
    		contentType:"application/json",
    		success: function(){
    			if(callback){
    				callback();
    			}
    		}
    	})
    }

    return{
    	getReply:getReply,
        getList:getList,
        countUp:countUp,
        addReply:addReply,
        removeReply:removeReply,
        updateReply:updateReply
    }
})();