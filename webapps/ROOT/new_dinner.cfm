<cfif structKeyExists(form, "submit")>
    <cfquery datasource="testdb">
        INSERT INTO dinner_log (dinner_date, meal_description, notes)
        VALUES (
            <cfqueryparam value="#form.dinner_date#" cfsqltype="cf_sql_date">,
            <cfqueryparam value="#form.meal_description#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#form.notes#" cfsqltype="cf_sql_varchar">
        );
    </cfquery>
    <cfoutput>Dinner entry added successfully!</cfoutput>
    <cfset location("mydinner.cfm")>
</cfif>

<h2>Insert New Dinner</h2>
<form method="post">
    <label for="dinner_date">Date:</label>
    <input type="date" name="dinner_date" required><br>

    <label for="meal_description">Meal Description:</label>
    <textarea name="meal_description" required></textarea><br>

    <label for="notes">Notes:</label>
    <textarea name="notes"></textarea><br>

    <button type="submit" name="submit">Add Dinner</button>
</form>
