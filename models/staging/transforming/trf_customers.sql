{{ config(materialized='table', schema = 'transforming', sql_header = 'use warehouse compute_wh;') }}
 
 select 
 c.CustomerID,
 c.CompanyName,
 c.ContactName,
 c.City,
 c.Country,
 d.Divisionname,
 c.Address,
 c.Fax,
 c.Phone,
 c.PostalCode,
 iff(c.StateProvince = '' , 'NA' , c.stateprovince) as statename
 from
 {{ref('stg_customers')}} as c inner join {{ref('lkp_divisions')}} as d
 on c.divisionid = d.divisionid