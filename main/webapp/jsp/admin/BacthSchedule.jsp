<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<form>
 <table>
        <tr>
            <td>Enter Job Name:</td>
            <td>            
                <input type="text" name="jobName" id="jobName"/>
            </td>           
        </tr>
        
    </table>
    <br/>
    <table>
        <tr>
            <td>Enter Date and Time:</td>
            <td>
                Year:
                <input type="text" name="year" id="year" style="width:100px"/>
            </td>
            <td>
                Month:
                <input type="text" name="month" id="month"/>
            </td>
            <td>
                Day:
                <input type="text" name="day" id="day" style="width:100px"/>
            </td>
            <td>
                Hour(24-hour):
                <input type="text" name="hour" id="hour" style="width:100px"/>
            </td>
            <td>
                Minute:
                <input type="text" name="minute"  id="minute" style="width:100px"/>
            </td>
        </tr>
        <tr>
            <td></td>
            <td style="padding: 5px;" colspan="5">
                <!-- <b>If given date/time is invalid then job will not get scheduled.
                If given date is older than current date then job will be started immediately</b>  -->
            </td>
        </tr>
    </table>
    <br/><br/>
    <table>
        <tr>
            <td style="padding: 5px;">
                Enter Cron expression
            </td>
            <td>
                <input type="text"  name="cronExpression"  id="cronExpression" style="width:200px"/>
            </td>
            <td>Select Sample Cron:</td>
            <td> 
                <select >
                    <option value="0 0/1 * 1/1 * ? *">Every 1 minutes</option>
                    <option value="0 0 10 1/1 * ? *">Every day at 10 AM</option>
                    <option value="0 0 0/1 1/1 * ? *">Every hour starting 10 AM</option>
                    <option value="0 0 10 ? * TUE,THU *">Every week Tue and Thur at 10 AM</option>
                </select>
            </td>
        </tr>
        <tr>
            <td></td>
            <td colspan="2">
               <!--  <b>If Cron expression is blank then it will be treated as One time job</b>  -->
            </td>
        </tr>
    </table>
<table>
        <tr>
            <td style="padding: 5px;" colspan="2">
                
                <!-- Used only in case of Adding New Job -->
                <input type="button" name="submit"  id="submit"  value="Submit"/>
                
                <!-- Used only in case of Edit Job -->
                <input type="button" name="submit" id="submit" value="Update"/>

                <input type="button" name="submit" id="submit" value="Cancel"/>
            </td>
        </tr>
    </table>
    
</form>
<br/><br/>
<div>
    <label>Job List:</label>
    <br/><br/>
    <!-- <label style="color: red">
        Note:<br/>
        1. Completed jobs will not be shown in listing.
        <br/> 
        2. If job is in "RUNNING" state then no action like "Pause, Resume, Delete, Edit" is allowed. </label> -->
    <br/><br/>

    <table class="table table-responsive table-hover" border="1" style="width : 100%;">
        <thead>
            <th>Job Name</th>
            <th>Job Schedule Time</th>
            <th>Job Last Fired Time</th>
            <th>Job Next Fire Time</th>
            <th>Action</th>
            <th>Job Status</th>
        </thead>
        <tbody>
            
                <tr>
                    <td><!-- {{jobRec.jobName}} --></td>
                    <td><!-- {{jobRec.scheduleTime | date: 'dd/MM/yyyy HH:mm:ss'}} --></td>
                    <td><!-- {{jobRec.lastFiredTime | date: 'dd/MM/yyyy HH:mm:ss'}} --></td>
                    <td><!-- {{jobRec.nextFireTime | date: 'dd/MM/yyyy HH:mm:ss'}} --></td>
                    <td>
                        <button>Start Job Now</button> |

                        <button>Pause Job</button> |

                        <button>Resume Job</button> |

                        <button>Delete Job</button> |

                        <button>Stop Job</button> |

                        <button>Edit Job</button>
                    </td>
                    <td><!-- {{jobRec.jobStatus}} --></td>
                </tr>
           
        </tbody>
    </table>
</div>
</body>
</html>