/* IS7. Replies of a message
\set messageId 206158432794
 */
select p2.m_messageid, p2.m_content, p2.m_creationdate, p_personid, p_firstname, p_lastname,
    (case when exists (
                       select 1 from knows
               where p1.m_creatorid = k_person1id and p2.m_creatorid = k_person2id)
      then 1
      else 0
      end)
from message p1, message p2, person
where
  p1.m_messageid = :messageId and p2.m_c_replyof = p1.m_messageid and p2.m_creatorid = p_personid
order by p2.m_creationdate desc, p2.m_creatorid asc;
;