// @ts-check

class Index {
  static greeter(person: string = 'Jane'): string {
    return `Hello ${person}!`;
  }

  static wave(): string {
    return 'Waving at you';
  }
}

// export default Index;
module.exports = Index;


// export function greeter(person?: string) {
//   return `Hello ${person}`;
// }

// export function wave() {
//   return `Waving at you`;
// }
