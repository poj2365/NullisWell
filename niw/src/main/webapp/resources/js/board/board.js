
const searchArticle = () => {
	const order = document.getElementById("order").value;
	const numbPerPage = document.getElementById("numPerPage").value;
	const search = document.getElementById("search").value;
	const likes = document.getElementById("likes").value;
	fetch("<%=request.getContextPath()%>/")
}