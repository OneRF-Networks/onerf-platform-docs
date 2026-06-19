# Contrato HTTP `/api/v1` — padrão OneRF B2B Platform

Norma transversal para APIs REST dos produtos OneRF. Cada serviço mantém o **OpenAPI vivo** no seu repositório; este documento define o **formato** comum.

**Decisão fechada:** [PLATFORM_VISION.md §5](PLATFORM_VISION.md) · **ADR implícito:** camelCase em JSON de API.

**Referências por produto:**

- Analytics: [b2b_analytics/openapi.yaml](../../../b2b_analytics/openapi.yaml)
- Backend IoT: [backend/openapi.yaml](../../../backend/openapi.yaml) + [Guia de Padronização API v1](../../../backend/docs/Guia_de_Padronizacao_de_API_v1.md)

---

## 1. Princípios

- API HTTP estilo REST; JSON como formato padrão.
- Contrato oficial em **OpenAPI 3.1** por serviço.
- Consistência acima de preferência individual.
- Compatibilidade retroativa dentro da mesma versão major (`/api/v1`).
- Segurança por padrão (secure-by-default).

---

## 2. URL e recursos

- Base path versionado: `/api/v1`.
- Recursos no plural, `kebab-case`: `/gateways`, `/endpoints`, `/sensors`.
- Identificador em path: `/endpoints/{endpointId}`.
- Sub-recursos: `/endpoints/{endpointId}/photos`.
- Evitar verbos em URL; usar método HTTP.
- Ações não CRUD, quando inevitáveis: sufixo explícito `/endpoints/{id}:ping`.

---

## 3. Métodos HTTP

| Método | Uso |
|--------|-----|
| `GET` | Leitura, sem efeito colateral |
| `POST` | Criação ou comando não idempotente |
| `PUT` | Substituição completa |
| `PATCH` | Atualização parcial (preferido) |
| `DELETE` | Remoção |

---

## 4. Status codes (mínimo)

| Código | Uso |
|--------|-----|
| `200` | Sucesso com payload |
| `201` | Criado |
| `204` | Sucesso sem payload |
| `400` | Entrada inválida |
| `401` | Sem autenticação |
| `403` | Sem permissão |
| `404` | Recurso inexistente |
| `409` | Conflito de estado |
| `422` | Regra de negócio inválida |
| `429` | Rate limit |
| `500` | Erro inesperado |

---

## 5. Contrato JSON — camelCase

- **Propriedades** e **query params** de `/api/v1` em **camelCase** (`pageSize`, `currentOrg`, …).
- Mongo/persistência pode manter snake_case internamente; **presenter/DTO** mapeia na borda HTTP.
- Códigos de erro em **SCREAMING_SNAKE_CASE**.

---

## 6. Formato de erro

```json
{
  "error": "Mensagem legível para o operador",
  "code": "SENSOR_NOT_FOUND",
  "details": {
    "requestId": "01HV7ZK8Y9M2...",
    "successor": "/api/v1/sensors"
  }
}
```

| Campo | Convenção |
|-------|-----------|
| `error` | string legível |
| `code` | SCREAMING_SNAKE_CASE |
| `details` | objeto; chaves camelCase |
| Datas em DTOs | ISO 8601 UTC (`2026-06-16T20:07:14Z`) |
| IDs em respostas | string; preferir `id` (não `_id` em listas) |

**Correlation:** header `X-Request-Id`; opcional em `details.requestId`.

---

## 7. ListResponse (listas paginadas)

```json
{
  "items": [],
  "total": 123,
  "page": 1,
  "pageSize": 25,
  "sort": "name",
  "order": "asc"
}
```

Query params: `q`, `sort`, `order`, `page`, `pageSize` — ver [UI_NAVIGATION.md §3.1.2](UI_NAVIGATION.md#312-listas--busca-ordenação-paginação-server-side).

Rotas legadas podem usar `{ "total", "data" }` até refactor; rotas novas usam `ListResponse`.

---

## 8. Versionamento

- Prefixo `/api/v1` para contrato actual.
- Breaking changes → `/api/v2` (não misturar sem versão).
- Rotas existentes **não renomear** dentro de v1 — marcar `legacy` no OpenAPI.

---

## 9. OpenAPI

- Marcar rotas com `x-implementation: live | legacy | planned`.
- Schemas reflectem camelCase no alvo.

---

*Última actualização: jun/2026 — consolidado de PLATFORM_VISION §8.2 e ARCHITECTURE_TARGET §13.*
