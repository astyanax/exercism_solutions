export function valid(digitString: string): boolean {
  if (digitString.trim().length <= 1) {
    return false;
  }
  const tab: number[] = [...digitString].filter((s: string): boolean => s !== ' ').map((s: string): number => parseInt(s));
  for (let i = tab.length - 2; i >= 0; i -= 2) {
    let tmp: number = tab[i] * 2;
    if (tmp >= 10) {
      tmp -= 9;
    }
    tab[i] = tmp;
  }
  return tab.reduce((a: number, b: number): number => a + b, 0) % 10 === 0;
}
