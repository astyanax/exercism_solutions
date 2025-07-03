public class Clock {
    private static final int DAY_MINUTES = 1440;
    private static final int HOUR_MINUTES = 60;
    private int minutes = 0;

    private static int normalize(int minutes) {
        return minutes < 0 ? DAY_MINUTES + (minutes % DAY_MINUTES) : minutes % DAY_MINUTES;
    }

    public Clock(int hours, int minutes) {
        this.minutes = normalize((hours * HOUR_MINUTES) + minutes);
    }

    public void add(int minutes) {
        this.minutes = normalize(this.minutes + minutes);
    }

    @Override
    public String toString() {
        return String.format("%02d:%02d", this.minutes / 60, this.minutes % 60);
    }

    @Override
    public boolean equals(Object other) {
        return other != null && other.getClass() == this.getClass() && ((Clock) other).minutes == minutes;
    }

}