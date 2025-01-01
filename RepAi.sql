--گزارش مربوط به تعداد خریدی که هر کاربر درخواست کرده است
use Tadarokat
select t1.*,t2.job,t2.namekes,t3.count_request from (SELECT        codeper, namep
FROM            info_User
WHERE        (disable = 0)) as t1

inner join 

(SELECT       job1.job, kesmat.namekes,codeper
FROM            kargozini.dbo.tblconstper INNER JOIN
                         kargozini.dbo.job1 ON tblconstper.nojob = job1.nojob INNER JOIN
                         kargozini.dbo.kesmat ON tblconstper.codekes = kesmat.codekes
						 
WHERE        (tblconstper.tas = 0)) as t2 on t1.codeper=t2.codeper
inner join (select Buy_request_codepersabt,count(*) as count_request from Tadarokat_Buy
where Buy_request_datesabt>='1403/01/01' and cancel_order=0
group by Buy_request_codepersabt) as t3 on t1.codeper=t3.Buy_request_codepersabt
order by count_request desc
