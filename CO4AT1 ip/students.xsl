<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">

        <html>

        <head>

            <title>Student Performance Report</title>

            <style>

                body {
                    font-family: Arial, sans-serif;
                    background: #f4f6f8;
                    margin: 0;
                    padding: 40px;
                }

                .container {
                    width: 90%;
                    margin: auto;
                    background: white;
                    padding: 25px;
                    border-radius: 10px;
                    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
                }

                h1 {
                    text-align: center;
                    color: #222;
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
                    margin-top: 25px;
                }

                th {
                    background: #222;
                    color: white;
                    padding: 12px;
                }

                td {
                    padding: 12px;
                    text-align: center;
                    border-bottom: 1px solid #ddd;
                }

                tr:hover {
                    background: #f1f1f1;
                }

                .excellent {
                    font-weight: bold;
                }

            </style>

        </head>

        <body>

            <div class="container">

                <h1>Student Performance Report</h1>

                <table>

                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Department</th>
                        <th>Mark</th>
                        <th>Grade</th>
                        <th>Performance</th>
                    </tr>

                    <xsl:for-each select="students/student">

                        <xsl:sort
                            select="mark"
                            data-type="number"
                            order="descending"/>

                        <tr>

                            <td>
                                <xsl:value-of select="id"/>
                            </td>

                            <td>
                                <xsl:value-of select="name"/>
                            </td>

                            <td>
                                <xsl:value-of select="department"/>
                            </td>

                            <td>
                                <xsl:value-of select="mark"/>
                            </td>

                            <td>
                                <xsl:value-of select="grade"/>
                            </td>

                            <td>

                                <xsl:choose>

                                    <xsl:when test="mark &gt;= 90">
                                        Excellent
                                    </xsl:when>

                                    <xsl:when test="mark &gt;= 80">
                                        Very Good
                                    </xsl:when>

                                    <xsl:when test="mark &gt;= 70">
                                        Good
                                    </xsl:when>

                                    <xsl:otherwise>
                                        Needs Improvement
                                    </xsl:otherwise>

                                </xsl:choose>

                            </td>

                        </tr>

                    </xsl:for-each>

                </table>

            </div>

        </body>

        </html>

    </xsl:template>

</xsl:stylesheet>