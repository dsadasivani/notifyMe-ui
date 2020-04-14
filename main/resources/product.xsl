<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">

	<xsl:template match="/">
		<html>

			<!-- <head>
				<style type="text/css">
					table.tfmt {
					border: 0px ;
					}

					td.colfmt {
					border: 1px ;
					background-color: white;
					color: black;
					text-align:right;
					}

					th {
					background-color: #2E9AFE;
					color: white;
					}

				</style>
			</head> -->

			<body>
				<!-- <table border="5"> -->
					<!-- <tr>
						<th style="width:250px">Title</th>
						<th style="width:350px">Link Name</th>
						<th style="width:250px">Description</th>
						<th style="width:250px">Date</th>


					</tr> -->

					<xsl:for-each select="rss/channel/item" >
						<xsl:if test="position() &lt; 9">
						<div class="row" style="border-bottom: 1px solid;border-color: rgba(0,0,0,0.2);padding-bottom: 1rem;border-bottom-width: thin;padding-top: 1rem;">
			
							<span>
								<xsl:value-of select="title" />
							</span>
							</div>
						</xsl:if>
						
							<!-- <td >
								<xsl:value-of select="link" />
							</td>

							<td >
								<xsl:value-of select="description" />
							</td>
							<td >
								<xsl:value-of select="pubDate" />
							</td> -->

					</xsl:for-each>
				<!-- </table> -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>