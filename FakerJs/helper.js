import { faker as f } from '@faker-js/faker';

export const getBasicUserInfo = () => {
    return {
        fname: f.name.firstName(),
        lname: f.name.lastName(),
        cin: f.helpers.replaceCreditCardSymbols('#{12}'),
        contact: f.helpers.replaceCreditCardSymbols('03[2-4]#{7}'),
        email: f.internet.email()
    };
}