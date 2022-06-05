import { getBasicUserInfo } from './helper.js';

/* 
 * beware: relaunching this file (using console.log) will not generate the
 * same data as in the file 'readyInsert.js'
 */

// === constant === //
    const N = 50;
// === end === //

// == CLIENT == //
let client = '';
for (let id = 0; id < N; id ++) {
    const { fname, lname, cin, contact } = getBasicUserInfo();
    client += `     (${id + 1}, '${fname}', '${lname}', '${cin}', '${contact}')`;

    client += (id !== N - 1) ? ',\n' : '\n;';
}
client = "INSERT INTO CLIENT values\n".concat(client);
// console.log(client);


// == CHAUFFEUR == //
let chauffeur = '';
for (let id = 0; id < N; id ++) {
    const { fname, lname, cin, contact, email } = getBasicUserInfo();
    chauffeur += `     (${id + 1}, '${fname}', '${lname}', '${cin}', '${contact}', '${email}')`;
    
    chauffeur += (id !== N - 1) ? ',\n' : '\n;';
}
chauffeur = "INSERT INTO CHAUFFEUR values\n".concat(chauffeur);
console.log(chauffeur);