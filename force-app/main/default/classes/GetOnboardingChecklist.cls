public with sharing class GetOnboardingChecklist {
    public class Request {
        @InvocableVariable(required=true) public String studentId;
    }
    public class Response {
        @InvocableVariable public Boolean fezPrimeiroAcessoAVA;
        @InvocableVariable public Boolean acessouConhecaEAD;
        @InvocableVariable public Boolean fezQuestEspacoCalouro;
        @InvocableVariable public Boolean entregouPrimeiraAtividade;
        @InvocableVariable public List<String> pendencias; // etapas ainda não concluídas
    }
    @InvocableMethod(label='Get Onboarding Checklist' description='Retorna etapas de ambientação e pendências')
    public static List<Response> run(List<Request> reqs) {
        List<Response> out = new List<Response>();
        for (Request r : reqs) {
            Response res = new Response();
            // MOCK
            res.fezPrimeiroAcessoAVA = true;
            res.acessouConhecaEAD = false;
            res.fezQuestEspacoCalouro = false;
            res.entregouPrimeiraAtividade = false;
            res.pendencias = new List<String>{
                'Acessar o Conheça EAD',
                'Fazer o questionário do Espaço Calouro',
                'Entregar a primeira atividade'
            };
            out.add(res);
        }
        return out;
    }
}