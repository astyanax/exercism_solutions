public class Lasagna {
    private static final int LASAGNA_COOK_MINUTES = 40;
    private static final int LASAGNA_LAYER_PREP_MINUTES = 2;

    public int expectedMinutesInOven() {
        return LASAGNA_COOK_MINUTES;
    }

    public int remainingMinutesInOven(int minutesInOven) {
        return LASAGNA_COOK_MINUTES - minutesInOven;
    }

    public int preparationTimeInMinutes(int layerCount) {
        return layerCount * LASAGNA_LAYER_PREP_MINUTES;
    }

    public int totalTimeInMinutes(int layerCount, int minutesInOven) {
        return preparationTimeInMinutes(layerCount) + minutesInOven;
    }
}