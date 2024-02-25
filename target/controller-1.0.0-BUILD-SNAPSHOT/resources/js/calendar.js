function displaymodal(m_id){
    console.log(m_id);
    document.getElementById("exampleModalLabel").innerText = m_id;
    document.getElementById("msgmodalcontent").innerText = "";
    $('#exampleModal').modal('show');
}
function sendmsg(){
    var msg_recid = document.getElementById("exampleModalLabel").innerText;
    var msg_content = document.getElementById("msgmodalcontent").innerText;
    $.ajax({
        type: 'POST',
        url: '/msgrest/sendmsg',
        data: {
            msg_recid: msg_recid,
            msg_content: msg_content
        },
        dataType: 'text',
        success: function(result) {
            // 성공 시 결과를 화면에 표시
            console.log('성공')
        },
        error: function(error) {
            console.log('Error:', error);
        }
    });
    $('#exampleModal').modal('hide');
}