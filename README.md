# Currículo — Kaiquy Damasio Santos Farias

Currículo em **PDF de 1 página** e a mesma versão em **site (HTML)**, gerados a partir de um único arquivo: `index.html`.

## Arquivos

| Arquivo | Descrição |
| --- | --- |
| `index.html` | O currículo (site). Contém o layout para tela **e** as regras de impressão (`@media print`) que geram o PDF em A4. |
| `Curriculo-Kaiquy-Damasio-Santos-Farias.pdf` | Versão final para enviar ou imprimir (1 página, A4). |
| `assets/foto.jpg` | Foto de perfil, já recortada em quadrado e com a rotação corrigida. |
| `assets/logo-intelectai.png` | Logo da Intelectai (usada na experiência na Intelectai). |
| `assets/logo-drogavaz.png` | Logo da Drogavaz (usada na experiência na Drogavaz). |
| `tools/build-pdf.ps1` | Script que regenera o PDF a partir do `index.html`. |

## Como regenerar o PDF

Depois de editar o `index.html`, rode no PowerShell (na raiz do projeto):

```powershell
powershell -ExecutionPolicy Bypass -File .\tools\build-pdf.ps1
```

O script usa o Chrome (ou o Edge) em modo headless para imprimir o `index.html` no mesmo PDF final.
Também dá para gerar na mão: abrir o `index.html` no navegador, `Ctrl+P`, tamanho **A4**, margens **nenhuma**
e marcar **"Gráficos de fundo"** para o fundo escuro sair no papel.

## Detalhes de conteúdo

- **Contato:** Silvânia – GO · (62) 99973-9154 · [@kaiquydamasio](https://instagram.com/kaiquydamasio)
- **Experiências:** Ajudante de Assentamento de Pisos (2025–atual), Desenvolvedor Júnior na Intelectai, remoto
  (jul–out/2025), Jovem Aprendiz na Drogavaz (jun–nov/2023), Auxiliar de Rejuntamento (2020–2024) e Auxiliar de
  Lava-Jato (2020).
- **Formação:** Ensino Médio — cursado até a 3ª série (seção discreta, entre o perfil e a experiência).

## Dicas de impressão

- Escolha **"Tamanho real" (100%)**, e não "ajustar à página", para as laterais escuras saírem certas.
- Para envio por WhatsApp/e-mail, use direto o arquivo `.pdf`.
