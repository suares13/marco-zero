public with sharing class TriggerPoloHandoff {
    public class Request {
        @InvocableVariable(required=true) public String studentId;
        @InvocableVariable public String motivo;        // texto livre, sem rótulo de risco
        @InvocableVariable public String contextoJornada; // o que já fez / o que falta
    }
    public class Response {
        @InvocableVariable public String caseId;
        @InvocableVariable public String mensagemAluno;
    }
    @InvocableMethod(label='Trigger Polo Handoff' description='Cria caso/tarefa para o polo acolher o aluno')
    public static List<Response> run(List<Request> reqs) {
        List<Response> out = new List<Response>();
        for (Request r : reqs) {
            Response res = new Response();
            // MOCK — em produção: criar Case/Task e rotear ao polo (Omni-Channel)
            res.caseId = 'MOCK-CASE-001';
            res.mensagemAluno = 'Vou te conectar com o pessoal do seu polo. '
                + 'Eles vão te dar todo o apoio que você precisa para seguir em frente.';
            out.add(res);
        }
        return out;
    }
}