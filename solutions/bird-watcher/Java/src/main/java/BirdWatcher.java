class BirdWatcher {
    private final int[] birdsSeenPerDay;

    public BirdWatcher(int[] birdsSeenPerDay) {
        this.birdsSeenPerDay = birdsSeenPerDay.clone();
    }

    public int[] getLastWeek() {
        return this.birdsSeenPerDay;
    }

    public int getToday() {
        if (this.birdsSeenPerDay.length == 0) {
            return 0;
        }
        return this.birdsSeenPerDay[this.birdsSeenPerDay.length - 1];
    }

    public void incrementTodaysCount() {
        this.birdsSeenPerDay[this.birdsSeenPerDay.length - 1]++;
    }

    public boolean hasDayWithoutBirds() {
        for (int birds : this.birdsSeenPerDay) {
            if (birds == 0) {
                return true;
            }
        }
        return false;
    }

    public int getCountForFirstDays(int numberOfDays) {
        int sum = 0;
        int min = Math.min(numberOfDays, this.birdsSeenPerDay.length);
        for (int i = 0; i < min; i++) {
            sum = sum + this.birdsSeenPerDay[i];
        }
        return sum;
    }

    public int getBusyDays() {
        int busyDays = 0;
        for (int birds : this.birdsSeenPerDay) {
            if (birds >= 5) {
                busyDays++;
            }
        }
        return busyDays;
    }
}
