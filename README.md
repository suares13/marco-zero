# 🏆 Marco Zero: Agentes Autônomos para Retenção EAD (Agentforce)

> **Solução Vencedora (1º Lugar Geral) no Hackathon Vitru 2026**  
> Desenvolvida durante uma maratona de 27 horas focada em combater o abandono acadêmico e potencializar o sucesso do estudante na educação a distância (EAD). 

Este repositório documenta a evolução e a arquitetura final da implementação de **Agentes de Inteligência Artificial Autônomos** focados em conversão e retenção humanizada.

---

## 🚀 Evolução da Arquitetura: Do Protótipo ao Salesforce

A concepção dos agentes não começou diretamente na plataforma corporativa. A engenharia de prompts e a lógica de roteamento de intenções foram iteradas em três fases tecnológicas distintas para validar a segurança e a empatia das respostas antes da integração com dados reais:

1. **Fase 1: Kiro, Antigravity e Gemini:** Ideação inicial da persona "Lisa" e do "Consultor", testando limites de empatia e capacidade de seguir diretrizes estritas sem alucinar.
2. **Fase 2: Protótipos em Python:** Codificação de roteadores de intenção (*Intent Routers*) customizados em Python, simulando o comportamento de árvores de decisão e chamadas a bases de conhecimento (RAG simulado).
3. **Fase 3: Salesforce Agentforce (Produção):** Transposição da lógica validada em Python para a arquitetura declarativa do **Salesforce Agentforce Builder**, integrando nativamente com Service Cloud, Data Cloud e bases de conhecimento reais (`EmployeeCopilot__AnswerQuestionsWithKnowledge`).

---

## 🤖 Engenharia de Agentes (Agent Definitions)

A solução final em produção utiliza a topologia de **Subagents** e **Roteadores de Intenção** nativos do Agentforce para garantir previsibilidade. O código fonte completo das definições (YAML) está disponível na pasta `/src/agentforce-definitions`.

### 1. Especialista de Sucesso do Aluno (Persona: Lisa)
Atua como um "concierge acadêmico humanizado", detectando sinais silenciosos de evasão e intervindo proativamente.

* **Inteligência Contextual e Guardrails:** O agente é instruído a classificar o humor do aluno (neutro, frustrado, ansioso) e o risco de evasão (*churn_risk: low, medium, high*). Em casos de desabafo extremo ou crise financeira, o sistema bloqueia respostas genéricas e direciona o fluxo para intervenção humana.
* **Subagentes Mapeados:**
  * **Roteador de Sucesso do Aluno:** Usa o modelo `DefaultEinsteinHyperClassifier` para despachar o contexto.
  * **Orientador Acadêmico Didático:** Resolve dúvidas sobre MAPA, estágios e notas.
  * **Orientador Administrativo & Financeiro:** Descomplica requerimentos e boletos.
  * **Especialista em Retenção Humanizada:** Foco exclusivo em escuta ativa para alunos que sinalizam cancelamento ou trancamento.
  * **Guia Visual do Studeo:** Em vez de dar respostas diretas, conduz o aluno passo a passo pela interface do AVA, criando independência tecnológica.

### 2. Consultor de Carreiras (UniCesumar)
Focado em conversão e ancoragem vocacional, operando como um *Closer* consultivo.

* **Lógica de Roteamento:**
  * **Roteador Comercial:** Identifica se o foco é dúvida de carreira (`go_to_course_guidance`) ou intenção imediata de matrícula (`go_to_enrollment_intent`).
  * **Consultoria e Quebra de Objeções:** Demonstra a matriz curricular e flexibilidade do EAD, ajustando variáveis dinâmicas de estado do lead (`course_confidence`).
  * **Foco na Venda (Anti-Desvio):** Redireciona papos fora de contexto para manter a segurança da interação.

---

## 🛡️ Privacy by Design & LGPD

A transição para o Agentforce garantiu que a execução respeitasse a LGPD desde a concepção:
* **Minimização:** O agente acessa apenas variáveis de contexto necessárias (`@MessagingEndUser.ContactId`, `RoutableId`).
* **Regras Estritas de Prompt (System Instructions):** Impossibilidade de solicitação de senhas, endereços físicos precisos ou geração arbitrária de links de pagamento, ancorando as consultas exclusivamente ao `rag_feature_config_id`.

---

## 📁 Estrutura do Repositório

```text
├── docs/
│   └── arquitetura-evolutiva.md      # Detalhes da transição de Python para Agentforce
├── src/
│   └── agentforce-definitions/
│       ├── consultor-carreiras.yaml  # Código de configuração do agente de vendas
│       └── especialista-sucesso.yaml # Código de configuração da Lisa (Retenção)
└── assets/
    └── [Diagramas e capturas do Agentforce Builder]
```

---

*Projeto desenvolvido e arquitetado por **Victória Suares** e **Cristiano Silva**, aliando engenharia de software, inteligência artificial (Prompt Engineering & RAG) e governança de dados.*

