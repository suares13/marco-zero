public with sharing class GetNextActivity {
    public class Request {
        @InvocableVariable(required=true) public String studentId;
    }
    public class Response {
        @InvocableVariable public String activityName;
        @InvocableVariable public String disciplineName;
        @InvocableVariable public Date dueDate;
        @InvocableVariable public String avaPath; // caminho para achar no AVA
    }
    @InvocableMethod(label='Get Next Activity' description='Retorna a próxima atividade e prazo')
    public static List<Response> run(List<Request> reqs) {
        List<Response> out = new List<Response>();
        for (Request r : reqs) {
            Response res = new Response();
            // MOCK
            res.activityName = 'Atividade 1 — Diagnóstica';
            res.disciplineName = 'Introdução ao EAD';
            res.dueDate = Date.today().addDays(7);
            res.avaPath = 'AVA > Minhas Disciplinas > Introdução ao EAD > Atividades';
            out.add(res);
        }
        return out;
    }
}