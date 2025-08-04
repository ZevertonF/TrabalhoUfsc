#set page(
  margin: 2.5cm, // Margens de 2,5 cm em todos os lados para a capa
  header: none,  // Sem cabeçalho na capa
  footer: none,  // Sem rodapé (número de página) na capa
)


#set text(lang: "pt")
// --- Bloco Superior: Logo e Informações da Instituição ---
#align(center)[
  // 1. Logo da UFSC
  // Certifique-se de que o arquivo 'ufsc_logo.png' esteja no mesmo diretório do seu arquivo .typ
  // Ajuste a largura (width) conforme necessário para o tamanho ideal
  //#image("Imagens/Ufsc.png", width: 2cm)

  #v(0.1cm) // Espaço vertical após o logo

  // 2. Informações da Universidade/Departamento
  #set text(12pt) // Fonte menor para este bloco
  #set par(leading: 0.9em, spacing: 0em) // Espaçamento entre linhas mais apertado e sem espaço entre "parágrafos"
  UNIVERSIDADE FEDERAL DE SANTA CATARINA \
  CENTRO DE CIÊNCIAS RURAIS \
  _CAMPUS_ XXX \
  DEPARTAMENTO DE CIÊNCIAS BIOLÓGICAS E AGRONÔMICAS \
  DISCIPLINA DE XXXX  \
  CURSO DE AGRONOMIA
]

// --- Espaço Flexível para empurrar o conteúdo para baixo ---
#v(1fr) // '1fr' distribui o espaço restante igualmente, empurrando o próximo bloco para baixo

// --- Bloco Central: Título do Trabalho ---
#align(center)[
  #set text(12pt) // Tamanho de fonte padrão para o título
  #set par(leading: 1em, spacing: 0.5em) // Ajuste o espaçamento entre linhas do título se ele quebrar em várias linhas

  // 3. Título do Trabalho (Negrito e MAIÚSCULAS)
  #strong[TITULO]
  #v(0.2cm) // Pequeno espaço entre o título e o nome científico

  // 4. Nome Científico (Itálico e entre parênteses)
  #emph[]
]

// --- Espaço Flexível para empurrar o conteúdo para baixo ---
#v(1fr) // '1fr' distribui o espaço restante igualmente, empurrando o próximo bloco para baixo

// --- Bloco Inferior Médio: Nome do Autor ---
#align(center)[
  #set text(12pt) // Tamanho de fonte padrão para o nome do autor
  XXXX
]

// --- Espaço Flexível para empurrar o conteúdo para o final da página ---
#v(1fr) // '1fr' distribui o espaço restante igualmente, empurrando o próximo bloco para o final

// --- Bloco Inferior: Cidade e Ano ---
#align(center)[
  #set text(12pt) // Tamanho de fonte padrão para cidade e ano
  Curitibanos
  
  2025
]

#set text(
  font: "Noto Color Emoji", // Ou "Times New Roman"
  size: 12pt,
  fill: black,
)




// Lembre-se de reiniciar o contador se quiser que a numeração comece em 1 a partir de um ponto específico
// #counter(page).update(1)


#set par(
  justify: true,            // Alinhamento justificado
  leading: 1.5em,           // Espaçamento entre linhas: 1,5 (aproximadamente 1.2em no Typst)
  spacing: 0.9em,             // Espaçamento entre parágrafos: 0 (não há espaço extra)
  first-line-indent: 1.25cm // Recuo da primeira linha: 1,25 cm
)



#pagebreak() // Após a folha de rosto, se houver
#set page(numbering: none) // Sumário não é numerado, mas as páginas anteriores sim.
                           // Se você quer que a numeração comece após o sumário,
                           // as páginas pré-textuais devem ser numeradas com algarismos romanos minúsculos.
                           // Ex: #set page(numbering: "i") para pré-textuais.

#show heading: it => {
  // Se o título for "Sumário" e não tiver numeração, não inclua no sumário
  if it.body == "Sumário" and it.numbering == none {
    it // Renderiza o heading, mas não o inclui no sumário por padrão (se não for um heading numerado)
  } else {
    it // Renderiza e inclui no sumário (comportamento padrão)
  }
}
#align(center)[
  #text(16pt, strong("Sumário")) // Use text() para o título, talvez com um tamanho maior e negrito
]
#outline(
  title:none,
  depth: 5, // Inclui até o nível 3 de cabeçalhos
  indent: 1.5em, // Recuo para cada nível no sumário
 // Preenche com pontos

 
)
#pagebreak() // Inicia o corpo do texto em uma nova página

#counter(page).update(1) // Reinicia a numeração para começar em 1

#set page(footer: context { // Mude 'header' para 'footer'
  // Verifica se o número da página é par
  if calc.even(counter(page).get().first()) {
    // Se for par, alinha à esquerda
    align(right, counter(page).display("1")) // Exemplo: numeração romana maiúscula
  } else {
    // Se for ímpar, alinha à direita
    align(right, counter(page).display("1")) // Exemplo: numeração romana maiúscula
  }
})

#show par: set par(first-line-indent: 1.5cm)



#include "corpo.typ"