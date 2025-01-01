--خرید های اورژانسی به تفکیک قسمت
use Tadarokat

select count(*) as count_emergency,rtrim(ltrim(Asker_ghesmat_name)) from Tadarokat_Buy
where Emergency_acc=1 and Buy_request_datesabt>'1403/01/01'
group by  Asker_ghesmat_code,Asker_ghesmat_name
order by count_emergency desc