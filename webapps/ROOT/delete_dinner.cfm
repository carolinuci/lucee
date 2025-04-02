<cfparam name="url.id" default="0">

<cfquery datasource="testdb">
    DELETE FROM dinner_log
    WHERE id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">;
</cfquery>

<cfoutput>Dinner entry deleted successfully!</cfoutput>
<cfset location("mydinner.cfm")>