<cfparam name="url.id" default="0">

<cfif structKeyExists(form, "submit")>
    <cfquery datasource="testdb">
        UPDATE dinner_log
        SET dinner_date = <cfqueryparam value="#form.dinner_date#" cfsqltype="cf_sql_date">,
            meal_description = <cfqueryparam value="#form.meal_description#" cfsqltype="cf_sql_varchar">,
            notes = <cfqueryparam value="#form.notes#" cfsqltype="cf_sql_varchar">
        WHERE id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">;
    </cfquery>
    <cfoutput>Dinner entry updated successfully!</cfoutput>
    <cfset location("mydinner.cfm")>
<cfelse>
    <cfquery name="getDinner" datasource="testdb">
        SELECT * FROM dinner_log WHERE id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">;
    </cfquery>
</cfif>

<h2>Update Dinner</h2>
<form method="post">
    <label for="dinner_date">Date:</label>
    <input type="date" name="dinner_date" value="#getDinner.dinner_date#" required><br>

    <label for="meal_description">Meal Description:</label>
    <textarea name="meal_description" required>#getDinner.meal_description#</textarea><br>

    <label for="notes">Notes:</label>
    <textarea name="notes">#getDinner.notes#</textarea><br>

    <button type="submit" name="submit">Update Dinner</button>
</form>