package util;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class StringListMapper {
    public static String toString(List<String> stringList) {
        return stringList.stream().collect(Collectors.joining(","));
    }
    public static List<String> toList(String string) {
        return Arrays.asList(string.split(","));
    }
}
