# Words test set
# https://raw.githubusercontent.com/snowballstem/snowball-data/master/russian/voc.txt

# Граматика української мови
# https://uk.wikipedia.org/wiki/%D0%93%D1%80%D0%B0%D0%BC%D0%B0%D1%82%D0%B8%D0%BA%D0%B0_%D1%83%D0%BA%D1%80%D0%B0%D1%97%D0%BD%D1%81%D1%8C%D0%BA%D0%BE%D1%97_%D0%BC%D0%BE%D0%B2%D0%B8

perfective_gerund = { # DONE
  'в'      => %w[подола|в           підня|в],
  'вши'    => %w[написа|вши         підня|вши],
  'вшись'  => %w[абсолютизува|вшись підня|вшись],

  'ивши'   => %w[дзвон|ивши],
  'ившись' => %w[дзвон|ившись],
  'ув'     => %w[приб|ув],
  'увши'   => %w[приб|увши],
  'увшись' => %w[дотикн|увшись]
}

adjective = { # DONE
  'іше іє і е ими' => %w[зелен|іше  послан|іє ароматн|і  зіпсован|е зіпсован|ими],
  'іший ий ій им'   => %w[зелен|іший  зелен|ий  великодн|ій глибок|им], # noun: ой =>палеоз|ой  perfective_gerund: ем => похапц|ем
  'ого'   => %w[ головн|ого ], # noun ім => екстр|ім   ом => заїзд|ом
  'ому их у я а'  => %w[веснян|ому зелен|их бронзов|у  верхн|я   весел|а], # !по-весняному?
  'ою'                  => %w[веснян|ою ],
  # noun 'ею'                  => %w[земл|ею],
}

adjectival = {
  'ем'      => %w[задава|емые     изменя|ем],
  'нн'      => %w[беспреста|нно   деревя|нными],
  'вш'      => %w[отказа|вшись    отделя|вший],
  'ющ щ'    => %w[сталкива|ющихся спеша|щих
                  умоля|ющими     блестя|щему],

  'ивш ывш' => %w[брод|ивших      несб|ывшееся],
  'ующ'     => %w[несуществ|ующий]
}

reflexive = {
  'ся' => %w[осек|ся],
  'сь' => %w[ввы|сь]
}

verb = {
  'ла на ете йте ли й'  => %w[сдела|ла воспита|на сдела|ете   сдела|йте   сдела|ли   сдела|й
                              приня|ла потеря|на  причиня|ете причиня|йте причиня|ли причиня|й],

  'л ем н ло но ет ют'  => %w[сдела|л воспита|ем сдела|н   сдела|ло   сдела|но  сдела|ет   сдела|ют
                              приня|л потеря|ем  растеря|н причиня|ло настоя|но объясня|ет объясня|ют],

  'ны ть ешь'           => %w[сдела|ны  сдела|ть  сдела|ешь
                              потеря|ны потеря|ть потеря|ешь],

  'нно'                 => %w[пута|нно постоя|нно],

  'ила ыла ена ейте'    => %w[беспоко|ила прикр|ыла  выруч|ена   пожал|ейте вспл|ыла], # вспл|ыла?
  'уйте ите или ыли ей' => %w[пожал|уйте  позвол|ите полюб|или   приб|ыли   приникш|ей],
  'уй ил ыл им ым ен'   => %w[протест|уй  проход|ил  раскр|ыл    редк|им    решительн|ым свобод|ен],
  'ило ыло ено ят ует'  => %w[став|ило    неун|ыло   обознач|ено обрат|ят   повеств|ует],
  'уют ит ыт ены ить'   => %w[преслед|уют прибеж|ит  закр|ыт     зауч|ены   затуш|ить],
  'ыть ишь ую ю'        => %w[откр|ыть    отправ|ишь отперт|ую   отрица|ю]
}

noun = {
  'а ев ов ие ье е'     => %w[вод|а       нап|ев     вопрос|ов  здрав|ие здоров|ье вопрос|е],
  'иями ями ами еи ии'  => %w[волнен|иями вопл|ями   вопрос|ами галер|еи гармон|ии],
  'и ией ей ой ий й'    => %w[потер|и     гармон|ией галере|ей  гер|ой   ген|ий    сара|й],
  'иям ям ием ем ам ом' => %w[губерн|иям  двер|ям    биен|ием   братц|ем бумаг|ам  букет|ом],
  'о у ах иях ях ы ь'   => %w[брюх|о      брюх|у     бумаг|ах   здан|иях камн|ях   казн|ы   камен|ь],
  'ию ью ю ия ья я'     => %w[комед|ию    кров|ью    кровл|ю    лечен|ия лист|ья   локт|я]
}

derivational = {
  'ост'  => %w[любезн|остей],
  'ость' => %w[любезн|остью]
}

tidy_up = {
  'н[н]ейш'  => %w[наиполезн|ейший    смирен|нейший],
  'н[н]ейше' => %w[многочислен|нейшее сильн|ейшее],
  'н[н]'     => %w[смирен|но          смирн|о],
  'ь'        => %w[совест|ь]
}

exceptions = {
  # ё => е
  'угнетённый' => 'угнетен',

  # -ию => ''
  'академию' => 'академ'
}

$all_tests = []
$errors = []

def incorrect_stem_msg(result_stem, word, stem)
  "Incorrect stemming '#{result_stem}' for word '#{word}', should be '#{stem}'"
end

def check_words_set(words_set)
  words_set.each do |_rule, test_cases|
    test_cases.each do |test_case|
      stem, ending = test_case.split('|')
      word = [stem, ending].join
      $all_tests << word
      result_stem = (`echo "#{word}" | ./stemwords -l ru`).strip
      $errors << incorrect_stem_msg(result_stem, word, stem) if result_stem != stem
    end
  end
end

[
  perfective_gerund,
  adjective,
  # adjectival,
  # reflexive,
  # verb,
  # noun,
  # derivational,
  # tidy_up
].each {|words_set| check_words_set(words_set) }

# exceptions.each do |word, stem|
#   $all_tests << word
#   result_stem = (`echo "#{word}" | ./stemwords -l uk`).strip
#   $errors << incorrect_stem_msg(result_stem, word, stem) if result_stem != stem
# end

$errors.empty? ? puts("#{$all_tests.count} test(s) passed successfully!") : puts($errors.join("\n"))