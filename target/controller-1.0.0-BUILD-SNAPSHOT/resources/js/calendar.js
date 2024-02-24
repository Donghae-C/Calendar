function displaymodal(m_id){
    console.log(m_id);
    document.getElementById("exampleModalLabel").innerText = m_id;
    document.getElementById("msgmodalcontent").innerText = "";
    $('#exampleModal').modal('show');
}