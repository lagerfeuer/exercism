import java.util.Arrays;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

class ParallelLetterFrequency {
    String[] texts;

    ParallelLetterFrequency(String[] texts) {
        this.texts = texts;
    }

    Map<Character, Integer> countLetters() {
        // Count letters in parallel and reduce result to Map<Character, Integer>
        return Arrays.stream(texts)
                .parallel()
                .map(t -> t.chars()
                        .mapToObj(c -> Character.toLowerCase((char) c))
                        .filter(Character::isLetter)
                        .collect(Collectors.groupingBy(Function.identity(), Collectors.summingInt(c -> 1))))
                .reduce((m1, m2) -> {
                    m2.forEach((k, v) -> m1.merge(k, v, Integer::sum));
                    return m1;
                })
                .orElse(Map.of());
    }

//    Map<Character, Integer> countLetters() {
//        Map<Character, Integer> result = Arrays.stream(texts)
//                .parallel()
//                .map(t -> t.chars()
//                        .mapToObj(c -> (char) c)
//                        .collect(Collectors.groupingBy(Function.identity(), Collectors.summingInt(c -> 1))))
//                .collect(Collectors.toMap());
//    }
}
