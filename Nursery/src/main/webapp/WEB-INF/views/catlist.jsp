
<%@ include file="adminhead.jsp"%>
<div id="main">
	<div class="page-heading">
		<div class="page-title">
			<div class="row">
				<div class="col-12 col-md-6 order-md-1 order-last">
					<h3>Category List</h3>
				</div>
				<div class="col-12 col-md-6 order-md-2 order-first">
					<nav aria-label="breadcrumb"
						class="breadcrumb-header float-start float-lg-end">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/dashboard">Dashboard</a></li>
							<li class="breadcrumb-item active" aria-current="page">Category
								List</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
		<section class="section">
			<div class="card">
				<div class="card-body">
					<table class="table table-striped" id="table1">
						<thead>
							<tr>
								<th>Id</th>
								<th>Category Image</th>
								<th>Category Name</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach items="${catlist }" var="cats">
								<tr>
									<td>${cats.catid}</td>
									<td><img src="${baseUrl}/${cats.catImage}" width="45"
										height="45"></td>
									<td>${cats.catName}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

		</section>
	</div>

	<%@ include file="admin-footer.jsp"%>